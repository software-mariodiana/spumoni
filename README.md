# Readme #

## Spumoni ##

Inpsired by an exercise from page 220 of *iOS Auto Layout Demystified, 2ed,* by Erica Sadun. The project uses Auto Layout to configure three views in a subview. Each view is equal in size to the other, and the three together fill out the entire super view. The effect created looks like a slice of spumoni ice cream.

The project, however, instead of using Interface Builder is done entirely in code. All Xib files have been deleted. Also, since Auto Layout code seems to fit better with the concept of the view in the Model-View-Controller pattern (and since controller classes have a tendency to get too big in iOS apps), the main view is a subclass of UIView, and all Auto Layout code is done there.

----------------

Touched: 2016-12-15
