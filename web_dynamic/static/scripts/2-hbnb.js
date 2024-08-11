#!/usr/bin/node
$(document).ready(function() {
    // Initialize variables to store Amenity IDs
    var selectedAmenities = [];

    // Listen for changes on each input checkbox tag
    $('input[type="checkbox"]').change(function() {
        // Get Amenity ID from the data attribute
        var amenityID = $(this).data('id');

        // Check if the checkbox is checked
        if ($(this).is(':checked')) {
            // Store Amenity ID in the variable
            selectedAmenities.push(amenityID);
        } else {
            // Remove Amenity ID from the variable
            selectedAmenities = selectedAmenities.filter(id => id !== amenityID);
        }

        // Update the h4 tag with the list of Amenities checked
        $('.Amenities h4').text(selectedAmenities.join(', '));
    });
});
