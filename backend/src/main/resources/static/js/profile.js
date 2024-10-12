$(document).ready(function() {
    // Handle experience deletion
    $('.button42').click(function() {
        var experienceId = $(this).data('experience-id');
        var confirmDelete = confirm("Do you want to delete this experience?");

        if (confirmDelete) {
            $.ajax({
                url: '/deleteExperience/' + experienceId,
                type: 'DELETE',
                success: function(result) {
                    // Remove the experience element
                    $('#experience-' + experienceId).remove();

                    // Refresh the page
                    location.reload();
                },
                error: function() {
                    alert("An error occurred while deleting the experience.");
                }
            });
        }
    });

    // Handle education deletion (using event delegation)
    $(document).on('click', '.button44', function() {
        var educationId = $(this).data('education-id');
        var confirmDelete = confirm("Do you want to delete this education?");

        if (confirmDelete) {
            $.ajax({
                url: '/deleteEducation/' + educationId,
                type: 'DELETE',
                success: function(result) {
                    // Remove the education element (closest ancestor with the class)
                    $(this).closest('.education-item').remove(); // Assuming your education has a class

                    // Refresh the page
                    location.reload();
                },
                error: function() {
                    alert("An error occurred while deleting the education.");
                }
            });
        }
    });
});
