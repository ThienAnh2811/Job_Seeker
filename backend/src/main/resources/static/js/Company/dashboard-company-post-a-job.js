function addProgrammingLanguageTag(event) {
    event.preventDefault();
    var select = document.getElementById('programingLanguagesDropdown');
    var selectedOption = select.options[select.selectedIndex];
    var languageTags = document.getElementById('requiredProgramingLanguagesTags');
    var selectedProgrammingLanguagesIdsInput = document.getElementById('selectedProgrammingLanguagesIds');

    // Check if a tag with the same id already exists
    var existingTag = languageTags.querySelector('.language-tag[data-id="' + selectedOption.value + '"]');
    if (existingTag) {
        alert('This programming language has already been added.');
        return;
    }

    // Create a new tag element
    var tag = document.createElement('span');
    tag.className = 'language-tag';
    tag.dataset.id = selectedOption.value;
    tag.textContent = selectedOption.text;

    // Create a delete button for the tag
    var deleteButton = document.createElement('button');
    deleteButton.textContent = 'Delete';
    deleteButton.addEventListener('click', function() {
        // Remove the tag element when the delete button is clicked
        languageTags.removeChild(tag);
        // Update the selected programming languages IDs when a tag is deleted
        updateSelectedProgrammingLanguagesIds();
    });

    tag.appendChild(deleteButton);
    languageTags.appendChild(tag);

    // Update the selected programming languages IDs when a new tag is added
    updateSelectedProgrammingLanguagesIds();
}

function updateSelectedProgrammingLanguagesIds() {
    var languageTags = document.getElementById('requiredProgramingLanguagesTags');
    var selectedProgrammingLanguagesIdsInput = document.getElementById('selectedProgrammingLanguagesIds');
    var programmingLanguagesIds = Array.from(languageTags.querySelectorAll('.language-tag')).map(tag => tag.dataset.id);
    selectedProgrammingLanguagesIdsInput.value = programmingLanguagesIds.join(',');
}
function addCategoryTag(event) {
    event.preventDefault();
    var select = document.getElementById('categoryDropdown');
    var selectedOption = select.options[select.selectedIndex];
    var categoryTags = document.getElementById('categoryTags');
    var selectedCategoryIdsInput = document.getElementById('selectedCategoryIds');

    // Check if a tag with the same id already exists
    var existingTag = categoryTags.querySelector('.category-tag[data-id="' + selectedOption.value + '"]');
    if (existingTag) {
        alert('This category has already been added.');
        return;
    }

    // Create a new tag element
    var tag = document.createElement('span');
    tag.className = 'category-tag';
    tag.dataset.id = selectedOption.value;
    tag.textContent = selectedOption.text;

    // Create a delete button for the tag
    var deleteButton = document.createElement('button');
    deleteButton.textContent = 'Delete';
    deleteButton.addEventListener('click', function() {
        // Remove the tag element when the delete button is clicked
        categoryTags.removeChild(tag);
        // Update the selected category IDs when a tag is deleted
        updateSelectedCategoryIds();
    });

    tag.appendChild(deleteButton);
    categoryTags.appendChild(tag);

    // Update the selected category IDs when a new tag is added
    updateSelectedCategoryIds();

    // Add the selected category ID to the hidden input field
    selectedCategoryIdsInput.value += (selectedCategoryIdsInput.value ? ',' : '') + selectedOption.value;
}



function updateSelectedCategoryIds() {
    var categoryTags = document.getElementById('categoryTags');
    var selectedCategoryIdsInput = document.getElementById('selectedCategoryIds');
    var categoryIds = Array.from(categoryTags.querySelectorAll('.category-tag')).map(tag => tag.dataset.id);
    selectedCategoryIdsInput.value = categoryIds.join(',');
}

function addNiceToHaveTag(event) {
    event.preventDefault();
    var select = document.getElementById('niceToHavesDropdown');
    var selectedOption = select.options[select.selectedIndex];
    var niceToHaveTags = document.getElementById('niceToHavesTags');
    var selectedNiceToHavesIdsInput = document.getElementById('selectedNiceToHavesIds');

    // Check if a tag with the same id already exists
    var existingTag = niceToHaveTags.querySelector('.niceToHave-tag[data-id="' + selectedOption.value + '"]');
    if (existingTag) {
        alert('This nice-to-have has already been added.');
        return;
    }

    // Create a new tag element
    var tag = document.createElement('span');
    tag.className = 'niceToHave-tag';
    tag.dataset.id = selectedOption.value;
    tag.textContent = selectedOption.text;

    // Create a delete button for the tag
    var deleteButton = document.createElement('button');
    deleteButton.textContent = 'Delete';
    deleteButton.addEventListener('click', function() {
        // Remove the tag element when the delete button is clicked
        niceToHaveTags.removeChild(tag);
        // Update the selected nice-to-haves IDs when a tag is deleted
        updateSelectedNiceToHavesIds();
    });

    tag.appendChild(deleteButton);
    niceToHaveTags.appendChild(tag);

    // Update the selected nice-to-haves IDs when a new tag is added
    updateSelectedNiceToHavesIds();
}

function updateSelectedNiceToHavesIds() {
    var niceToHaveTags = document.getElementById('niceToHavesTags');
    var selectedNiceToHavesIdsInput = document.getElementById('selectedNiceToHavesIds');
    var niceToHavesIds = Array.from(niceToHaveTags.querySelectorAll('.niceToHave-tag')).map(tag => tag.dataset.id);
    selectedNiceToHavesIdsInput.value = niceToHavesIds.join(',');
}
function displaySelectedImage(event) {
    var selectedFile = event.target.files[0];
    var reader = new FileReader();

    var imgTag = document.getElementById("selectedImage");
    imgTag.title = selectedFile.name;

    reader.onload = function(event) {
        imgTag.src = event.target.result;
    };

    reader.readAsDataURL(selectedFile);
}