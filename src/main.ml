let hexlet_dir = Filename.concat (Unix.getenv "HOME") "hexlet-challenges";;
let course_name = ref "";;

let init () =
  if not (Sys.file_exists hexlet_dir) then begin
    Printf.printf "'%s' has been created\n" hexlet_dir;
    Unix.mkdir hexlet_dir 0o755
  end else
    Printf.printf "'%s' already exists\n" hexlet_dir;
  ()
;;

let fetch () =
  Sys.command (Printf.sprintf "git clone https://github.com/hexlet-challenges/course-%s.git" !course_name);
  ()
;;

(*raise (Failure argument)*)
let action argument = match argument with
  | "init" -> init ()
  | "fetch" -> fetch ()
  | _ -> failwith "Unknown command"
;;

let usage = "usage: " ^ Sys.argv.(0) ^ " <course's slug>"
let speclist = [
  "-c", Arg.Set_string (course_name), ": some int parameter"
]

let () =
  (* Read the arguments *)
  Arg.parse
    speclist
    (fun x -> (action x))
    usage;
;;
