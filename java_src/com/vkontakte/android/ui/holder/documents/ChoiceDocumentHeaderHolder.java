package com.vkontakte.android.ui.holder.documents;

import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.fragments.documents.DocumentsChooserFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class ChoiceDocumentHeaderHolder extends RecyclerHolder<DocumentsChooserFragment> implements View.OnClickListener {
    public ChoiceDocumentHeaderHolder(ViewGroup v) {
        super((int) R.layout.choice_document_header, v);
        $(R.id.load_from_gallery).setOnClickListener(this);
        $(R.id.load_from_storage).setOnClickListener(this);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(DocumentsChooserFragment item) {
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.load_from_gallery /* 2131755619 */:
                getItem().choiceDocFromGallery();
                return;
            case R.id.load_from_storage /* 2131755620 */:
                getItem().choiceDocFromStorage();
                return;
            default:
                return;
        }
    }
}
