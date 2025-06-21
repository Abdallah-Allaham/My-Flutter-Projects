abstract class BaseViewModel with BaseViewModelInputs
    ,BaseViewModelOutputs {
  //shared variables and function that will be used through any view model
}

mixin  BaseViewModelInputs {
  void start(); // start view model job
  void dispose(); // will be called when view model dies
}

mixin BaseViewModelOutputs {
  // will be implemented later
}
