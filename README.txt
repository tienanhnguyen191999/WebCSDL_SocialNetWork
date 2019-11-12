Notification
	type in[1,2,3]   - 1 ~ comment
			 - 21 ~ like
			 - 22 ~ dislike
			 - 3 ~ friend request

!!!
NewFeed render rules: Render post come from ME and FRIENDS ORDERBY ID ( TIMESTAMP )
RESOLVED.
-> Listed friend 
-> add all friends ID to array 
-> concate by "," 
-> QUERY use WHERE USER_ID IN(array) ORDERBY POST_ID DESC 


Post 
	type in[1,2,3]   - 1 ~ Only text
			 - 2 ~ include Photo
			 - 3 ~ include Videos

Like
	value in[1,-1]   - 1 ~ Like
			 - 2 ~ Dislike

!! TOMCAT failed to start => check for servlet mapping
!! Handle text with UTF-8 format when pass throung AJAX => Use encodingURIComponent() ~ decodingURIComponent()