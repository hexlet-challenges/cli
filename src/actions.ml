let init hexlet_dir =
  if not (Sys.file_exists hexlet_dir) then begin
    Printf.printf "'%s' has been created\n" hexlet_dir;
    Unix.mkdir hexlet_dir 0o755
  end else
    Printf.printf "'%s' already exists\n" hexlet_dir;
  ()
;;

let fetch course_name =
  Sys.command (Printf.sprintf "git clone https://github.com/hexlet-challenges/course-%s.git" !course_name);
  ()
;;
