function confirmDelete(imgElement) {
    var postId = imgElement.getAttribute('data-id');
    var result = prompt("Enter 'Delete' to delete this recruitment or 'Set Inactive'/'Set Active' to set it as inactive/active.");

    if (result === 'Delete') {
        fetch('/api/posts/post/' + postId, {
            method: 'DELETE',
        }).then(response => {
            if (response.ok) {
                imgElement.parentElement.remove();
            } else {
                alert('An error occurred while deleting the post.');
            }
        });
    } // job-listing.js
    else if (result === 'Set Inactive') {
        fetch('/api/posts/post/' + postId + '/inactive', {
            method: 'PUT',
        }).then(response => {
            if (response.ok) {
                alert('The post has been set to inactive.');
            } else {
                alert('An error occurred while setting the post to inactive.');
            }
        });
    }else if (result === 'Set Active') {
        fetch('/api/posts/post/' + postId + '/active', {
            method: 'PUT',
        }).then(response => {
            if (response.ok) {
                alert('The post has been set to active.');
            } else {
                alert('An error occurred while setting the post to active.');
            }
        });
    }
}