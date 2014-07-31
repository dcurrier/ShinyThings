var actionButtonInputBinding = new Shiny.InputBinding();
  $.extend(actionButtonInputBinding, {
    find: function(scope) {
      return $(scope).find(".action-button");
    },
    getValue: function(el) {
      return $(el).data('val') || 0;
    },
    setValue: function(el, value) {
      $(el).data('val', value);
    },
    getType: function(el) {
      return 'shiny.action';
    },
    subscribe: function(el, callback) {
      $(el).on("click.actionButtonInputBinding", function(e) {
        var $el = $(this);
        var val = $el.data('val') || 0;
        $el.data('val', val + 1);

        callback();
      });
    },
    getState: function(el) {
      return { value: this.getValue(el) };
    },
    receiveMessage: function(el, data) {
      /*if (data.hasOwnProperty('value'))
        this.setValue(el, data.value);

      $(el).trigger('change');*/
    },
    unsubscribe: function(el) {
      $(el).off(".actionButtonInputBinding");
    }
  });
  Shiny.inputBindings.register(actionButtonInputBinding, 'shiny.actionButtonInput');