package com.vkontakte.android.fragments.documents;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.design.widget.FloatingActionButton;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.Toast;
import com.facebook.common.util.UriUtil;
import com.vk.attachpicker.AttachIntent;
import com.vk.attachpicker.PhotoVideoAttachActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.docs.DocsGetTypes;
import com.vkontakte.android.attachments.PendingDocumentAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.VkTabbedLoaderFragment;
import com.vkontakte.android.fragments.utils.FilePickerFragment;
import com.vkontakte.android.ui.ListDialog;
import com.vkontakte.android.upload.DocumentUploadTask;
import com.vkontakte.android.upload.Upload;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class DocumentsViewFragment extends VkTabbedLoaderFragment implements View.OnClickListener {
    private static final int ADD_FILE_RESULT = 102;
    private static final int ADD_PHOTO_RESULT = 101;
    protected VKAPIRequest currentReq;
    private boolean canAdd = false;
    private FloatingActionButton floatingActionButton = null;
    private List<DocumentsByTypeFragment> fragments = null;
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.documents.DocumentsViewFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context arg0, Intent intent) {
            if (Upload.ACTION_UPLOAD_DONE.equals(intent.getAction())) {
                List<DocumentsByTypeFragment> fragments = DocumentsViewFragment.this.fragments;
                if (fragments != null) {
                    for (DocumentsByTypeFragment fr2 : fragments) {
                        if (fr2.loaded) {
                            fr2.reload();
                        }
                    }
                }
            } else if (Upload.ACTION_UPLOAD_FAILED.equals(intent.getAction())) {
                Toast.makeText(DocumentsViewFragment.this.getActivity(), (int) R.string.error, 0).show();
            }
        }
    };

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        IntentFilter filter = new IntentFilter();
        filter.addAction(Upload.ACTION_UPLOAD_DONE);
        filter.addAction(Upload.ACTION_UPLOAD_FAILED);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }

    @Override // me.grishka.appkit.fragments.TabbedLoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setTitle(R.string.docs);
        int ownerID = getArguments().getInt("owner_id");
        setCanAdd(ownerID == 0 || VKAccountManager.isCurrentUser(ownerID));
    }

    void setCanAdd(boolean canAdd) {
        this.canAdd = canAdd;
        ViewUtils.setVisibility(this.floatingActionButton, canAdd ? 0 : 8);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateView(inflater, container, savedInstanceState);
        FrameLayout relativeLayout = new FrameLayout(inflater.getContext());
        this.floatingActionButton = (FloatingActionButton) inflater.inflate(R.layout.floating_action_button, (ViewGroup) relativeLayout, false);
        this.floatingActionButton.setOnClickListener(this);
        relativeLayout.addView(view);
        relativeLayout.addView(this.floatingActionButton, this.floatingActionButton.getLayoutParams());
        ViewUtils.setVisibility(this.floatingActionButton, this.canAdd ? 0 : 8);
        return relativeLayout;
    }

    @Override // me.grishka.appkit.fragments.TabbedLoaderFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.floatingActionButton = null;
        this.fragments = null;
    }

    @Override // com.vkontakte.android.fragments.VkTabbedLoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        loadData();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        final int ownerId = getArguments().getInt("owner_id");
        this.currentReq = new DocsGetTypes(ownerId).setCallback(new Callback<DocsGetTypes.Result>() { // from class: com.vkontakte.android.fragments.documents.DocumentsViewFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(DocsGetTypes.Result result) {
                ArrayList<DocumentsByTypeFragment> fragments = new ArrayList<>();
                List<String> titles = new ArrayList<>();
                int i = 0;
                while (i < result.docTypes.size()) {
                    DocsGetTypes.DocType docType = result.docTypes.get(i);
                    fragments.add(DocumentsByTypeFragment.create(ownerId, docType.id, i == 0 ? result.docs : null));
                    titles.add(docType.name);
                    i++;
                }
                DocumentsViewFragment.this.setCanAdd(result.canAdd);
                DocumentsViewFragment.this.setTabs(DocumentsViewFragment.this.fragments = fragments, titles);
                DocumentsViewFragment.this.dataLoaded();
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                DocumentsViewFragment.this.onError(error);
                ViewUtils.setVisibilityAnimated(DocumentsViewFragment.this.errorView, 0);
                ViewUtils.setVisibilityAnimated(DocumentsViewFragment.this.progress, 8);
                DocumentsViewFragment.this.currentReq = null;
            }
        }).exec((View) this.contentView);
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.floating_button /* 2131755671 */:
                List<ListDialog.ListDialogItem> items = new ArrayList<>();
                items.add(new ListDialog.ListDialogItem(0, Integer.valueOf((int) R.string.add_doc_photo), Integer.valueOf((int) R.drawable.ic_docs_gallery)));
                items.add(new ListDialog.ListDialogItem(1, Integer.valueOf((int) R.string.add_doc_file), Integer.valueOf((int) R.drawable.ic_docs_upload)));
                ListDialog.show(v.getContext(), items, v, DocumentsViewFragment$$Lambda$1.lambdaFactory$(this));
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onClick$0(AdapterView parent, View view, int position, long id) {
        switch ((int) id) {
            case 0:
                startAddPhoto();
                return;
            case 1:
                startAddFile();
                return;
            default:
                return;
        }
    }

    void startAddPhoto() {
        Intent intent = new Intent(getActivity(), PhotoVideoAttachActivity.class);
        intent.putExtra(AttachIntent.INTENT_SELECTION_LIMIT, 100);
        intent.putExtra(AttachIntent.INTENT_PREVENT_STYLING, true);
        intent.putExtra("media_type", 111);
        startActivityForResult(intent, 101);
    }

    void startAddFile() {
        new FilePickerFragment.Builder().setSizeLimit(209715200L).forResult(this, 102);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        int ownerID = getArguments().getInt("owner_id");
        if (resCode == -1) {
            ArrayList<PendingDocumentAttachment> docs = new ArrayList<>();
            if (reqCode == 101) {
                Bundle resultBundle = data.getBundleExtra(AttachIntent.RESULT_ATTACHMENTS);
                if (resultBundle != null) {
                    ArrayList<Uri> files = resultBundle.getParcelableArrayList(AttachIntent.RESULT_FILES);
                    if (files != null) {
                        Iterator<Uri> it = files.iterator();
                        while (it.hasNext()) {
                            Uri uri = it.next();
                            if (UriUtil.LOCAL_FILE_SCHEME.equals(uri.getScheme()) || UriUtil.LOCAL_CONTENT_SCHEME.equals(uri.getScheme())) {
                                int size = (int) new File(uri.getPath()).length();
                                String[] ext = uri.getLastPathSegment().split("\\.");
                                docs.add(new PendingDocumentAttachment(uri.getLastPathSegment(), uri.toString(), size, uri.toString(), 0, Upload.getNewID(), ext[ext.length - 1]));
                            }
                        }
                    } else {
                        return;
                    }
                }
            } else if (reqCode == 102) {
                Iterator it2 = data.getParcelableArrayListExtra("files").iterator();
                while (it2.hasNext()) {
                    Parcelable p = (Parcelable) it2.next();
                    docs.add((PendingDocumentAttachment) p);
                }
            }
            if (!docs.isEmpty()) {
                Iterator<PendingDocumentAttachment> it3 = docs.iterator();
                while (it3.hasNext()) {
                    PendingDocumentAttachment att = it3.next();
                    DocumentUploadTask task = new DocumentUploadTask(getActivity(), att.url, ownerID, false, true);
                    task.setDoneNotification(getString(R.string.doc_upload_ok), getString(R.string.doc_upload_ok_long), PendingIntent.getActivity(getActivity(), 0, new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/docs" + ownerID)), 0));
                    Upload.start(getActivity(), task);
                }
            }
        }
    }
}
