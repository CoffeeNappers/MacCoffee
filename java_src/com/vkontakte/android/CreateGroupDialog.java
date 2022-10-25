package com.vkontakte.android;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.groups.GroupsCreate;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.CompoundRadioGroup;
/* loaded from: classes2.dex */
public class CreateGroupDialog extends DialogFragment {
    private int mActivePublicType = -1;
    private TextView mGroupName;
    private CompoundRadioGroup mGroupTypes;
    private View mOkButton;
    private Spinner mPublicType;
    private String[] mPublicTypes;

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mPublicTypes = getResources().getStringArray(R.array.public_types);
    }

    @Override // android.app.DialogFragment
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        return new VKAlertDialog.Builder(getActivity()).setTitle(R.string.action_create_group).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).setView(createView(getActivity().getLayoutInflater())).create();
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onStart() {
        super.onStart();
        this.mOkButton = ((AlertDialog) getDialog()).getButton(-1);
        verifyUserInput();
        this.mOkButton.setOnClickListener(CreateGroupDialog$$Lambda$1.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onStart$0(View v) {
        String type = null;
        switch (this.mGroupTypes.getCheckedId()) {
            case R.id.group /* 2131755776 */:
                type = "group";
                break;
            case R.id.public_page /* 2131755777 */:
                type = "public";
                break;
            case R.id.event /* 2131755779 */:
                type = "event";
                break;
        }
        if (type != null) {
            createGroup(this.mGroupName.getText().toString(), type, this.mActivePublicType + 1);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.mGroupName = null;
        this.mGroupTypes = null;
        this.mOkButton = null;
    }

    private View createView(LayoutInflater layoutInflater) {
        View view = layoutInflater.inflate(R.layout.group_create_dialog, (ViewGroup) null);
        this.mGroupName = (TextView) view.findViewById(R.id.name);
        this.mGroupName.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.CreateGroupDialog.1
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                CreateGroupDialog.this.verifyUserInput();
            }
        });
        this.mGroupTypes = (CompoundRadioGroup) view.findViewById(R.id.group_type);
        this.mPublicType = (Spinner) view.findViewById(R.id.public_type);
        this.mPublicType.setVisibility(this.mGroupTypes.getCheckedId() == R.id.public_page ? 0 : 8);
        this.mGroupTypes.setOnCheckedChangeListener(CreateGroupDialog$$Lambda$2.lambdaFactory$(this));
        this.mGroupTypes.setCheckedId(R.id.group);
        ArrayAdapter<CharSequence> adapter = new ArrayAdapter<CharSequence>(getActivity(), 17367048, this.mPublicTypes) { // from class: com.vkontakte.android.CreateGroupDialog.2
            @Override // android.widget.ArrayAdapter, android.widget.Adapter
            public int getCount() {
                return super.getCount() - 1;
            }
        };
        adapter.setDropDownViewResource(17367049);
        this.mPublicType.setAdapter((SpinnerAdapter) adapter);
        this.mPublicType.setSelection(this.mPublicTypes.length - 1);
        this.mPublicType.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.vkontakte.android.CreateGroupDialog.3
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> parent, View view2, int position, long id) {
                CreateGroupDialog.this.mActivePublicType = position;
                CreateGroupDialog.this.verifyUserInput();
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createView$1(View v, boolean isChecked) {
        this.mPublicType.setVisibility(v.getId() == R.id.public_page ? 0 : 8);
        verifyUserInput();
    }

    private void createGroup(String title, String type, int subtype) {
        new GroupsCreate(title, type, subtype).setCallback(new SimpleCallback<Group>(this) { // from class: com.vkontakte.android.CreateGroupDialog.4
            @Override // com.vkontakte.android.api.Callback
            public void success(Group group) {
                Groups.addGroup(group, true);
                CreateGroupDialog.this.dismiss();
                CreateGroupDialog.this.gotoNextStep(group);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void gotoNextStep(Group group) {
        new ProfileFragment.Builder(-group.id).go(getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void verifyUserInput() {
        if (this.mOkButton != null) {
            this.mOkButton.setEnabled(this.mGroupName.getText().length() > 0 && (this.mGroupTypes.getCheckedId() != R.id.public_page || (this.mActivePublicType > -1 && this.mActivePublicType < this.mPublicTypes.length + (-1))));
        }
    }
}
