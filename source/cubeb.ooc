CUBEB: enum {
	OK: extern(CUBEB_OK)
	ERROR: extern(CUBEB_ERROR)
	ERROR_INVALID_FORMAT: extern(CUBEB_ERROR_INVALID_FORMAT)
}

StateCallback: class {
}

state_thunk : func () {

}

state_callbacks := ArrayList

Context: cover from cubeb* {
	new: extern(cubeb_init) static func -> This
	destroy: extern(cubeb_destroy) func@
}

Stream: cover from cubeb_stream* {
	STARTED: extern(CUBEB_STATE_STARTED) static Int
	STOPPED: extern(CUBEB_STATE_STOPPED) static Int
	DRAINED: extern(CUBEB_STATE_DRAINED) static Int

	new: extern(cubeb_stream_init) static func -> This
	new: func ~simple (=stateCallback, =dataCallback, =sampleFormat) -> This {
		
	}

	sampleFormat: Int

	stateCallback: Func (Int)
	dataCallback: Func (Pointer, Long)

	getPosition: extern(cubeb_stream_get_position) func@

	start: extern(cubeb_stream_start) func@
	stop: extern(cubeb_stream_stop) func@

	destroy: extern(cubeb_stream_destroy) func@
}
