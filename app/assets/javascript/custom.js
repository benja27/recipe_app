document.addEventListener('DOMContentLoaded', function() {
  const switchElement = document.getElementById('flexSwitchCheckChecked');

  switchElement.addEventListener('change', function() {
    const recipeId = switchElement.getAttribute('recipe_id');
    const newState = switchElement.checked;

    // Send an AJAX request to update the state
    fetch(`/recipes/update_switch_state?recipe_id=${recipeId}&new_state=${newState}`, {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ new_state: newState })
    })
      .then(response => response.json())
      .then(data => {
        if (data.message === 'Switch state updated successfully') {
          // Update the state in the UI or show a success message
          console.log('Switch state updated successfully');
        } else {
          // Handle the case where the state change fails
          console.error('Switch state update failed');
        }
      })
      .catch(error => {
        // Handle any errors that occur during the AJAX request
        console.error('An error occurred:', error);
      });
  });
});