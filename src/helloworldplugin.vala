namespace HelloWorld {
    public class HelloWorldPlugin : Peas.ExtensionBase, Peas.Activatable {
        // Assigned by Code at runtime, has to be casted to plugin interface object below.
        public Object object { owned get; construct; }

        Scratch.Services.Interface plugins;
        Scratch.MainWindow main_window;

        public void update_state() { return; }

        public void activate()
        {
            plugins = (Scratch.Services.Interface)object;
            plugins.hook_window.connect((window) => {
                this.main_window = window;
            });

            print("hello, world - activate\n");
        }

        public void deactivate()
        {
            print("hello, world - deactivate\n");
        }
    }
}

// Gets picked up by libpeas engine.
[ModuleInit]
public void peas_register_types(GLib.TypeModule module) {
    var objmodule = module as Peas.ObjectModule;
    objmodule.register_extension_type(typeof(Peas.Activatable),
                                      typeof(HelloWorld.HelloWorldPlugin));
}
