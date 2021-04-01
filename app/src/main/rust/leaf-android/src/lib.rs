use jni::{
    objects::{JClass, JString},
    JNIEnv,
};

#[allow(non_snake_case)]
#[no_mangle]
pub unsafe extern "C" fn Java_com_leaf_example_aleaf_SimpleVpnService_runLeaf(
    env: JNIEnv,
    _: JClass,
    configPath: JString,
    protect_path: JString,
) {
    leaf_mobile::run_leaf(
        env.get_string(configPath).expect("invalid path").as_ptr(),
        env.get_string(protect_path).expect("invalid path").as_ptr(),
    );
}
