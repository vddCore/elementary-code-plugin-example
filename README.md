This repository contains binary blobs and VAPIs copied from Code editor to make the project straightforward to build out-of-box.  
Detailed explanation: https://elementaryos.stackexchange.com/questions/18389/how-to-develop-extensions-for-code/18899#18899

Dependencies:
   - `elementary-sdk`
   - ...whatever [Code](https://github.com/elementary/code) requires.

Build with:
```
meson build && cd build && ninja
```

