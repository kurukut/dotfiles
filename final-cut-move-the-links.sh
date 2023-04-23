# Old link is
# /Volumes/kurukut video/youtube/springgardenfarming/day3/MVI_2464.MP4
# make it new link
# /Volumes/kuttuFiles/oldutube/youtube/springgardenfarming/day3/MVI_2464.MP4

for symlink_file in $(find . -type l); do
	echo $symlink_file
	current_link="$(readlink $symlink_file)"
	if grep "Volumes/kurukut video" <<< "$current_link" >> /dev/null; then
		new_link=$(sed 's#kurukut video#kuttuFiles/oldutube#' <<< "$current_link")
		echo "$current_link -> $new_link" 
		echo "Going to replace"
		read
		ln -s -f $new_link "$symlink_file"
		echo "Replaced"
		read
	fi
done
