package xerode.geom {
	/**
	 * @author paul.bennett
	 */
	public class Vector2D {
		
		/*
		 * PROPERTIES
		 */
		
			private var _x:Number;
			private var _y:Number;
			
		/*
		 * METHODS
		 */
			
			/*
			 * CONSTRUCTOR
			 * @param	nx
			 * @param	ny
			 */
			public function Vector2D( nx:Number = 0, ny:Number = 0 ) {
				
				this.x = nx;
				this.y = ny;
				
			}
			
			/**
			 * Adds the value of the x and y elements of the current Vector2D object to the values of the x and y elements of another Vector2D object.
			 * @param	nv
			 * @return
			 */
			public function add( nv:Vector2D ):Vector2D {
				return new Vector2D( this.x + nv.x, this.y + nv.y );
			}
			
			/**
			 * Returns a new Vector2D object that is an exact copy of the current Vector2D object.
			 * @return
			 */
			public function clone():Vector2D {
				return new Vector2D( this.x, this.y );
			}
			
			/**
			 * Copies all of vector data from the source Vector2D object into the calling Vector2D object.
			 * @param	nv
			 */
			public function copyFrom( nv:Vector2D ):void {
				this.x = nv.x;
				this.y = nv.y;
			}
			
			/**
			 * Calculates the cross product of this vector and another given vector.
			 * @param v2 Another Vector2D instance.
			 * @return Number The cross product of this vector and the one passed in as a parameter.
			 */
			public function crossProduct( v2:Vector2D ):Number {
				return _x * v2.y - _y * v2.x;
			}
			
			/**
			 * Decrements the value of the x and y elements of the current Vector2D object by the values of the x and y elements of specified Vector2D object.
			 * @param	nv
			 */
			public function decrementBy( nv:Vector2D ):void {
				
				this.x -= nv.x;
				this.y -= nv.y;
				
			}
			
			/**
			 * Determines whether two Vector2D objects are equal by comparing the x and y elements of the current Vector2D object with a specified Vector2D object.
			 * @param	nv
			 * @return
			 */
			public function equals( nv:Vector2D ):Boolean {
				return( this.x == nv.x && this.y && nv.y );
			}
			
			/**
			 * Increments the value of the x and y elements of the current Vector2D object by the values of the x and y elements of a specified Vector2D object.
			 * @param	nv
			 */
			public function incrementBy( nv:Vector2D ):void {
				
				this.x += nv.x;
				this.y += nv.y;
				
			}
			
			/**
			 * Determines whether two Vector2D objects are equal by comparing the x and y elements of the current Vector2D object with a specified Vector2D object.
			 * @param	nv
			 * @return
			 */
			public function nearEquals( nv:Vector2D, tolerance:Number ):Boolean {
				
				var dx:Number = this.x - nv.x;
				var dy:Number = this.y - nv.y;
				
				return ( dx * dx + dy * dy ) <= tolerance * tolerance;
				
			}
			
			/**
			 * Sets the current Vector2D object to its inverse.
			 */
			public function negate():void {
				this.x *= -1;
				this.y *= -1;
			}
			
			/**
			 * Converts a Vector2D object to a unit vector by dividing x and y by the length of the vector
			 * @return The length of the current Vector2D object
			 */
			public function normalize():Number {
				
				var l:Number = this.length;
				
				this.x /= l;
				this.y /= l;
				
				return l;
				
			}
			
			// project
			
			/**
			 * Scales the current Vector2D object by a scalar, a magnitude.
			 * @param	s
			 */
			public function scaleBy( s:Number ):void {
				this.x *= s;
				this.y *= s;
			}
			
			/**
			 * Sets the members of Vector2D to the specified values.
			 * @param	nx
			 * @param	ny
			 */
			public function setTo( nx:Number, ny:Number ):void {
				this.x = nx;
				this.y = ny;
			}
			
			/**
			 * Returns a string representation of the current Vector2D object. The string contains the values of the x and y properties.
			 * @return		A string containing the values of the x and y properties.
			 */
			public function toString():String {
				return "Vector2D(" + this.x + ", " + this.y + ")";
			}
			
			/**
			 * Subtracts the value of the x and y elements of the current Vector2D object from the values of the x and y elements of another Vector2D object.
			 * @param	nv
			 * @return
			 */
			public function subtract( nv:Vector2D ):Vector2D {
				return new Vector2D( this.x - nv.x, this.y - nv.y );
			}
			
		/*
		 * ADDITIONAL METHODS
		 * When compared ot Vector3D, anyway
		*/
		
			/**
			 * Sets this vector's x and y values, and thus length, to zero.
			 * @return Vector2D A reference to this vector.
			 */
			public function zero():Vector2D {
				this.x = 0;
				this.y = 0;
				return this;
			}
			
			/**
			 * Whether or not this vector is equal to zero, i.e. its x, y, and length are zero.
			 * @return Boolean True if vector is zero, otherwise false.
			 */
			public function isZero():Boolean {
				return this.x == 0 && this.y == 0;
			}
			
			/**
			 * Ensures the length of the vector is no longer than the given value.
			 * @param max The maximum value this vector should be. If length is larger than max, it will be truncated to this value.
			 * @return Vector2D A reference to this vector.
			 */
			public function truncate( max:Number ):Vector2D {
				this.length = Math.min( max, this.length );
				return this;
			}
			
			/**
			 * Whether or not this vector is normalized, i.e. its length is equal to one.
			 * @return Boolean True if length is one, otherwise false.
			 */
			public function isNormalized():Boolean {
				return this.lengthSquared == 1.0;
			}
			
			/**
			 * Calculates the dot product of this vector and another given vector.
			 * @param v2 Another Vector2D instance.
			 * @return Number The dot product of this vector and the one passed in as a parameter.
			 */
			public function dotProduct( v2:Vector2D ):Number {
				return this.x * v2.x + this.y * v2.y;
			}
			
			/**
			 * Determines if a given vector is to the right or left of this vector.
			 * @return int If to the left, returns -1. If to the right, +1.
			 */
			public function sign( v2:Vector2D ):int {
				return this.perp.dotProduct( v2 ) < 0 ? -1 : 1;
			}

			/**
			 * Calculates the distance from this vector to another given vector.
			 * @param v2 A Vector2D instance.
			 * @return Number The distance from this vector to the vector passed as a parameter.
			 */
			public function dist( v2:Vector2D ):Number {
				return Math.sqrt( this.distSQ( v2 ) );
			}

			/**
			 * Calculates the distance squared from this vector to another given vector.
			 * @param v2 A Vector2D instance.
			 * @return Number The distance squared from this vector to the vector passed as a parameter.
			 */
			public function distSQ( v2:Vector2D ):Number {
				var dx:Number = v2.x - this.x;
				var dy:Number = v2.y - this.y;
				return dx * dx + dy * dy;
			}

		/*
		 * PROPERTY ACCESSORS/MUTATORS
		 */
			public function get x():Number {
				return _x;
			}
	
			public function set x( x:Number ):void {
				_x = x;
			}
	
			public function get y():Number {
				return _y;
			}
	
			public function set y( y:Number ):void {
				_y = y;
				
			}
			
			/**
			 * Sets / gets the length or magnitude of this vector. Changing the length will change the x and y but not the angle of this vector.
			 */
			public function set length( value:Number ):void {
				var a:Number = angle;
				_x = Math.cos( a ) * value;
				_y = Math.sin( a ) * value;
			}
			
			public function get length():Number {
				
				return Math.sqrt( this.lengthSquared );
				
			}
			
			public function get lengthSquared():Number {
			
				return this.x * this.x + this.y * this.y;
				
			}
			
			/**
			 * Gets / sets the angle of this vector. Changing the angle changes the x and y but retains the same length.
			 */
			public function set angle( value:Number ):void {
				var len:Number = length;
				_x = Math.cos( value ) * len;
				_y = Math.sin( value ) * len;
			}

			public function get angle():Number {
				return Math.atan2( _y, _x );
			}
			
			/**
			 * Finds a vector that is perpendicular to this vector.
			 * @return Vector2D A vector that is perpendicular to this vector.
			 */
			public function get perp():Vector2D {
				return new Vector2D( -this.y, this.x );
			}
		
	}
}
