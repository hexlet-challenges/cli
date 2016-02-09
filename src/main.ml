let hexlet_dir = Filename.concat (Unix.getenv "HOME") "hexlet-challenges";;

let init =
  if not (Sys.file_exists hexlet_dir) then
    Unix.mkdir hexlet_dir 0o755;;

init
