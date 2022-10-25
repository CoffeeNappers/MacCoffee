package com.vk.sharing;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import com.vk.sharing.picker.GroupPickerInfo;
/* loaded from: classes2.dex */
public class Picking {

    /* loaded from: classes2.dex */
    public static class Builder {
        private Context context;
        private GroupPickerInfo groupPickerInfo = new GroupPickerInfo();

        public Builder(Context context) {
            this.context = context;
        }

        public Builder preselectGroup(int id) {
            this.groupPickerInfo.preselectedGroupId = id;
            return this;
        }

        public Builder restrictToAdminedGroup() {
            this.groupPickerInfo.restrictToAdminedGroup = true;
            return this;
        }

        public Builder adminedGroupId(int id) {
            this.groupPickerInfo.adminedGroupId = id;
            return this;
        }

        public void pick(Fragment fragment, int requestCode) {
            fragment.startActivityForResult(createIntent(), requestCode);
        }

        private Intent createIntent() {
            return new Intent(this.context, SharingActivity.class).putExtra("mode", 1).putExtra("picker_info", this.groupPickerInfo);
        }
    }
}
