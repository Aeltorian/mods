-- Intentionally blank file
--
-- Settings are loaded during executable startup, and then published into the
-- Lua state.
--
-- Settings files in <root>/settings/default/ are loaded first.
-- Then if any files exist in <root>/settings/, they are read and their values
-- are used to overwrite the values from the defaults folder (if there are any
-- values).
