$(document).ready(function() {
    $('#showMoreButton').click(function() {
        var moreContent = $('#moreContent');
        if (moreContent.css('display') === 'none') {
            moreContent.show();
        } else {
            moreContent.hide();
        }
    });
});
$(document).ready(function() {
    $('#toggleButton').click(function() {
        var levelsContainer = $('#levelsContainer');
        if (levelsContainer.css('display') === 'none') {
            levelsContainer.css('display', 'block');
        } else {
            levelsContainer.css('display', 'none');
        }
    });
});
window.onload = function() {
    document.getElementById('toggleButtonSalary').addEventListener('click', function() {
        var salaryContainer = document.getElementById('salaryContainer');
        if (salaryContainer.style.display === 'none') {
            salaryContainer.style.display = 'block';
        } else {
            salaryContainer.style.display = 'none';
        }
    });
};
function toggleOptions() {
    var otherOptions = document.getElementById("otherOptions");
    if (otherOptions.style.display === "none") {
        otherOptions.style.display = "block";
        otherOptions.classList.add("show");
    } else {
        otherOptions.style.display = "none";
        otherOptions.classList.remove("show");
    }
}
$(document).ready(function() {
    // Level filter
    $('input[name="filterLevel[]"]').change(function() {
        var selectedLevels = [];
        $('input[name="filterLevel[]"]:checked').each(function() {
            selectedLevels.push($(this).val());
        });
        var url = new URL(window.location.href);
        url.searchParams.set('filterLevel', selectedLevels.join(','));
        window.location.href = url.toString();
    });

    // Salary filter
    $('input[name="filterSalary[]"]').change(function() {
        var selectedSalaries = [];
        $('input[name="filterSalary[]"]:checked').each(function() {
            selectedSalaries.push($(this).val());
        });
        var url = new URL(window.location.href);
        url.searchParams.set('filterSalary', selectedSalaries.join(','));
        window.location.href = url.toString();
    });
});
$(document).ready(function() {
    $('input[name="filterCategory[]"]').change(function() {
        var selectedCategories = [];
        $('input[name="filterCategory[]"]:checked').each(function() {
            selectedCategories.push($(this).val());
        });
        var url = new URL(window.location.href);
        url.searchParams.set('filterCategory', selectedCategories.join(','));
        window.location.href = url.toString();
    });
});
$(document).ready(function() {
    $('form').on('submit', function(e) {
        e.preventDefault();

        var selectedCategories = [];
        $('input[name="filterCategory[]"]:checked').each(function() {
            selectedCategories.push($(this).val());
        });

        var url = '/findjobs?filterCategory=' + selectedCategories.join(',');
        window.location.href = url;
    });
});
document.querySelector('form').addEventListener('submit', function(event) {
    event.preventDefault(); // prevent the form from submitting normally

    var keySearch = document.querySelector('input[name="keySearch"]').value;
    var location = document.querySelector('select[name="location"]').value;

    // create the URL with the form data
    var url = '/findjobs?keySearch=' + keySearch + '&location=' + location;

    // redirect to the URL
    window.location.href = url;
});
function submitForm() {
    var keySearch = document.getElementById("keySearchInput").value;
    var location = document.getElementById("locationInput").value;
    var url = "/findjobs?keySearch=" + encodeURIComponent(keySearch) + "&location=" + encodeURIComponent(location);
    window.location.href = url;
}
function getSearchRecommendations(query) {
    fetch('/search?query=' + encodeURIComponent(query))
        .then(response => response.json())
        .then(recommendations => {
            // update the search bar with the recommendations
            var searchBar = document.getElementById('keySearchInput');
            searchBar.innerHTML = '';
            recommendations.forEach(function(recommendation) {
                var option = document.createElement('option');
                option.value = recommendation;
                searchBar.appendChild(option);
            });
        });
}document.getElementById('keySearchInput').addEventListener('input', function(event) {
    getSearchRecommendations(event.target.value);
});
document.getElementById('findJobsForm').addEventListener('submit', function(event) {
    event.preventDefault();  // Prevent the form from being submitted normally

    var query = document.getElementById('keySearchInput').value;  // Get the query from the input field

    fetch('/search?query=' + query)  // Send a GET request to the /search endpoint with the query as a parameter
        .then(response => response.json())  // Parse the response as JSON
        .then(recommendations => {
            // Display the recommendations
            // This will depend on how you want to display the recommendations in your front-end
        });
});
$(document).ready(function() {
    $('#locationInput').change(function() {
        var location = $(this).val();
        var url = new URL(window.location.href);
        url.searchParams.set('location', location);
        window.location.href = url.toString();
    });
});
