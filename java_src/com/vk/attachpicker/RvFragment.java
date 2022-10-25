package com.vk.attachpicker;

import android.app.Fragment;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class RvFragment extends Fragment {
    private RecyclerView recyclerView;

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.picker_fragment_rv, (ViewGroup) null);
    }

    @Override // android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        LinearLayoutManager manager = new LinearLayoutManager(getActivity());
        this.recyclerView = (RecyclerView) view.findViewById(R.id.rv_recycler);
        this.recyclerView.setLayoutManager(manager);
        this.recyclerView.setAdapter(new TestAdapter());
    }

    /* loaded from: classes2.dex */
    private class TestAdapter extends RecyclerView.Adapter<TestHolder> {
        private TestAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public TestHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new TestHolder();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(TestHolder holder, int position) {
            holder.update(position);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return 100;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class TestHolder extends RecyclerView.ViewHolder {
        private TextView text;

        public TestHolder() {
            super(LayoutInflater.from(RvFragment.this.getActivity()).inflate(R.layout.picker_adapter_layout, (ViewGroup) RvFragment.this.recyclerView, false));
            this.text = (TextView) this.itemView.findViewById(R.id.tv_text);
        }

        public void update(int position) {
            this.text.setText("Not implemented yet");
        }
    }
}
