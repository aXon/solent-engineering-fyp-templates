-- =====================================================================
--  wordcount.lua -- counts the words of the main body while it is typeset
--  Part of the SEF639 Final Report template (Solent University)
--
--  How it works: LuaTeX hands every finished paragraph to the callback
--  below before breaking it into lines. Between \wordcountstart and
--  \wordcountstop the callback counts the words in paragraphs that sit
--  directly in the running text.
--
--  Counted:      body text, headings, list items, block quotations
--  Not counted:  figure and table captions, table contents, footnotes,
--                mathematics, guidance boxes, margin notes, and
--                everything outside the main body (front matter,
--                references, bibliography, appendices)
--
--  This matches the Handbook rule "main body of text, excluding
--  bibliography and appendices". The result can differ slightly from
--  other counters (Overleaf, texcount, Word); the figure reported here is
--  the one to quote, and to check against the target.
-- =====================================================================

fyp_wc = fyp_wc or {}
local wc = fyp_wc

wc.active   = false
wc.paused   = 0      -- >0 inside guidance boxes
wc.total    = 0
wc.chapters = {}
wc.maxchap  = 0

local GLYPH = node.id("glyph")
local GLUE  = node.id("glue")
local MATH  = node.id("math")
local HLIST = node.id("hlist")
local VLIST = node.id("vlist")

-- a "word" must contain at least one letter or digit, so stray
-- punctuation such as an en dash surrounded by spaces is not counted
local function is_wordchar(c)
  return (c >= 48 and c <= 57)          -- 0-9
      or (c >= 65 and c <= 90)          -- A-Z
      or (c >= 97 and c <= 122)         -- a-z
      or (c >= 0xC0 and c <= 0x24F)     -- accented Latin letters
      or (c >= 0x370 and c <= 0x3FF)    -- Greek
      or (c >= 0xFB00 and c <= 0xFB06)  -- ligatures (fi, fl, ff ...)
end

local function count_list(head)
  local n = 0
  local inword, hasalnum, inmath = false, false, false
  local cur = head
  while cur do
    local id = cur.id
    if id == MATH then
      if inword and hasalnum then n = n + 1 end
      inword, hasalnum = false, false
      inmath = (cur.subtype == 0)          -- 0 = start of inline maths
    elseif not inmath then
      if id == GLYPH then
        inword = true
        if is_wordchar(cur.char) then hasalnum = true end
      elseif id == GLUE then               -- a space ends a word
        if inword and hasalnum then n = n + 1 end
        inword, hasalnum = false, false
      elseif (id == HLIST or id == VLIST) and cur.head then
        -- boxed text inside a word (e.g. \mbox, units): part of the word
        if count_list(cur.head) > 0 then inword, hasalnum = true, true end
      end
    end
    cur = cur.next
  end
  if inword and hasalnum then n = n + 1 end
  return n
end

function wc.filter(head, groupcode)
  -- groupcode "" = a paragraph in the running text; captions ("vbox"),
  -- table cells ("vtop"/"hbox") and footnotes ("insert") are skipped
  if wc.active and wc.paused == 0 and groupcode == "" then
    local n  = count_list(head)
    local ch = tex.getcount("c@chapter")
    wc.chapters[ch] = (wc.chapters[ch] or 0) + n
    if ch > wc.maxchap then wc.maxchap = ch end
    wc.total = wc.total + n
  end
  return true
end

luatexbase.add_to_callback("pre_linebreak_filter", wc.filter, "fyp.wordcount")

-- one row per chapter for the word-count report (draft mode)
function wc.report_rows()
  for ch = 1, wc.maxchap do
    tex.sprint(string.format("\\FYPwcrow{%d}{%d}", ch, wc.chapters[ch] or 0))
  end
end
