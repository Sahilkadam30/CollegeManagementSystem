<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.util.Base64, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<title>Student Gallery</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #F6F0D7;
    margin: 0;
}

/* Header */
.header {
    background: #4F4D46;
    color: white;
    padding: 10px;
    text-align: center;
    position: relative;
}
.back-btn {
    position: absolute;
    left: 15px;
    top: 20px;
    padding: 8px 14px;
    background: white;
    color: #0d6efd;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: bold;
}

/* Gallery grid */
.gallery {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
    padding: 30px;
}

/* Card */
.card {
	margin: 20px;
    background: white;
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.15);
}

/* Post header */
.posted-by {
    font-weight: bold;
    margin-bottom: 5px;
}
.time {
    font-size: 12px;
    color: gray;
    margin-bottom: 10px;
}

/* Image */
.card img {
    width: 100%;
    border-radius: 10px;
    margin: 10px 0;
}

/* Actions */
.actions {
    display: flex;
    gap: 10px;
    margin-top: 10px;
}
.actions button {
    padding: 6px 12px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

/* Comment section */
.comments {
    margin-top: 10px;
    font-size: 14px;
}
.comment {
    background: #f2f2f2;
    padding: 5px;
    border-radius: 5px;
    margin-top: 5px;
}
.gallery {
    margin-bottom: 100px;
}

.bottom-bar {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 70%;
    border-radius:5px;
    background: #4F4D46;
    padding: 15px;
    display: flex;
    gap: 10px;
    align-items: center;
    box-shadow: 0 -3px 8px rgba(0,0,0,0.2);
}

.bottom-bar input[type="text"] {
    flex: 2;
    padding: 10px;
    border-radius: 6px;
    border: none;
    font-size: 14px;
}

.bottom-bar input[type="file"] {
    flex: 1;
    color: white;
}

.bottom-bar button {
    padding: 10px 20px;
    background: white;
    color: #30608C;
    border: none;
    border-radius: 6px;
    font-weight: bold;
    cursor: pointer;
}

.bottom-bar button:hover {
    background: #e7f1ff;
}

</style>
</head>

<body>

<div class="header">
    <button class="back-btn" onclick="history.back()">Back</button>
    <h1>🖼️ Students Gallery</h1>
</div>

<div class="gallery">

<%
    String loggedPrn = (String) session.getAttribute("prn");

    List<Map<String, Object>> posts =
        (List<Map<String, Object>>) request.getAttribute("posts");

    SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy, hh:mm a");

    if (posts != null) {
        for (Map<String, Object> post : posts) {
%>

<div class="card">

    <!-- Name & Time -->
    <div class="posted-by">
        👤 <%= post.get("name") %> (<%= post.get("prn") %>)
    </div>
    <div class="time">
        <%= sdf.format(post.get("time")) %>
    </div>

    <!-- Message -->
    <p><%= post.get("message") %></p>

    <!-- Image -->
    <img src="data:image/jpeg;base64,<%= 
        Base64.getEncoder().encodeToString((byte[]) post.get("image")) 
    %>" />

    <!-- Actions -->
    <div class="actions">

        <!-- LIKE -->
        <form action="LikeServlet" method="post">
            <input type="hidden" name="postId" value="<%= post.get("id") %>">
            <button type="submit">❤️ Like</button>
            <span>
        		<%= post.get("likes") == null ? 0 : post.get("likes") %> Likes
    		</span>
        </form>

        <!-- DELETE (OWNER ONLY) -->
        <%
    		if (loggedPrn != null && loggedPrn.equals(post.get("prn"))) {
		%>
		<form action="<%=request.getContextPath()%>/DeletePostServlet" method="post">
    		<input type="hidden" name="postId" value="<%= post.get("id") %>">
    		<button type="submit" style="color:red;">🗑 Delete</button>
		</form>
		<%
    		}
		%>
    </div>

    <!-- COMMENTS -->
    <div class="comments">
		<%
    		List<Map<String, Object>> comments =
        	(List<Map<String, Object>>) post.get("comments");

    		if (comments != null) {
        	for (Map<String, Object> c : comments) {
		%>
    	<div class="comment">
        	<b><%= c.get("name") %>:</b> <%= c.get("comment") %>
    	</div>
		<%
        	}
    	}
	%>
	</div>


    <!-- ADD COMMENT -->
    <form action="<%=request.getContextPath()%>/CommentServlet" method="post">
    <input type="hidden" name="postId" value="<%= post.get("id") %>">
    <input type="text" name="comment" placeholder="Write a comment..." required>
    <button type="submit">Comment</button>
</form>


</div>

<%
        }
    }
%>

</div>

<form action="<%=request.getContextPath()%>/UploadGalleryServlet"
      method="post"
      enctype="multipart/form-data"
      class="bottom-bar">

    <input type="text"
           name="message"
           placeholder="Write your message..."
           required>

    <input type="file"
           name="photo"
           accept="image/*"
           required>

    <button type="submit">Post</button>
</form>


</body>
</html>
