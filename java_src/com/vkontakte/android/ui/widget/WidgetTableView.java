package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutCompat;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Pair;
import android.util.SparseArray;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
import com.facebook.drawee.generic.RoundingParams;
import com.vk.attachpicker.widget.RobotoMediumTextView;
import com.vk.core.common.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.api.widget.WidgetTable;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class WidgetTableView extends WidgetTitleView {
    private final List<TextView> headItems;
    private final SparseArray<List<View>> rowItems;
    private final List<Pair<String, Float>> rowSettings;
    private final TableLayout table;
    private static final TableLayout.LayoutParams tableParams = new TableLayout.LayoutParams(-1, -2);
    private static final int iconSize = V.dp(24.0f);

    public WidgetTableView(Context context) {
        this(context, null);
    }

    public WidgetTableView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetTableView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.rowSettings = new ArrayList();
        this.headItems = new ArrayList();
        this.rowItems = new SparseArray<>();
        this.table = new TableLayout(context);
        this.table.setLayoutParams(new LinearLayoutCompat.LayoutParams(-1, -2));
        this.table.setDividerDrawable(context.getResources().getDrawable(R.drawable.divider_widget));
        this.table.setPadding(V.dp(10.0f), 0, V.dp(10.0f), V.dp(8.0f));
        this.table.setShowDividers(2);
        this.table.setDividerPadding(V.dp(6.0f));
        this.table.setShrinkAllColumns(true);
        addView(this.table);
    }

    @Override // com.vkontakte.android.ui.widget.WidgetTitleView, com.vkontakte.android.ui.widget.WidgetBinder
    public void bind(Widget widget) {
        super.bind(widget);
        bind((WidgetTable) widget);
    }

    private void bind(WidgetTable widget) {
        View textView;
        if (this.headItems.size() != widget.getHead().size() || this.rowItems.size() != widget.getBody().size()) {
            this.table.removeAllViews();
            this.headItems.clear();
            this.rowItems.clear();
            this.rowSettings.clear();
            Context context = getContext();
            this.table.setColumnStretchable(0, !widget.hasWeights());
            if (widget.hasHeader()) {
                TableRow row = new TableRow(context);
                row.setLayoutParams(tableParams);
                for (WidgetTable.HeadRowItem item : widget.getHead()) {
                    TextView textView2 = createTextView(context, createRowLayoutParams(item.getWeight()), item.getAlign(), true, true);
                    row.addView(textView2);
                    this.headItems.add(textView2);
                    this.rowSettings.add(Pair.create(item.getAlign(), Float.valueOf(item.getWeight())));
                    bindTextView(textView2, item.getText(), null, null, false, true);
                }
                this.table.addView(row);
            } else {
                for (WidgetTable.HeadRowItem item2 : widget.getHead()) {
                    this.rowSettings.add(Pair.create(item2.getAlign(), Float.valueOf(item2.getWeight())));
                }
            }
            List<WidgetTable.Row> rows = widget.getBody();
            boolean hasIcons = widget.hasIcons();
            for (int i = 0; i < rows.size(); i++) {
                TableRow row2 = new TableRow(context);
                row2.setLayoutParams(tableParams);
                List<View> views = new ArrayList<>();
                List<WidgetTable.RowItem> items = rows.get(i).getItems();
                for (int j = 0; j < items.size() && j < this.rowSettings.size(); j++) {
                    WidgetTable.RowItem item3 = items.get(j);
                    Pair<String, Float> pair = this.rowSettings.get(j);
                    if (j == 0) {
                        textView = createTextViewWithImage(context, createRowLayoutParams(((Float) pair.second).floatValue()), (String) pair.first);
                    } else {
                        textView = createTextView(context, createRowLayoutParams(((Float) pair.second).floatValue()), (String) pair.first, false, true);
                    }
                    row2.addView(textView);
                    views.add(textView);
                    ImageSize image = item3.hasIcon() ? item3.getIcon().getImageByWidth(iconSize) : null;
                    bindTextView(textView, item3.getText(), image, item3.getUrl(), hasIcons, false);
                }
                this.rowItems.put(i, views);
                this.table.addView(row2);
            }
            return;
        }
        this.table.setColumnStretchable(0, !widget.hasWeights());
        for (int i2 = 0; i2 < this.headItems.size(); i2++) {
            TextView textView3 = this.headItems.get(i2);
            bindTextView(textView3, widget.getHead().get(i2).getText(), null, null, false, true);
        }
        List<WidgetTable.Row> rows2 = widget.getBody();
        boolean hasIcons2 = widget.hasIcons();
        for (int i3 = 0; i3 < this.rowItems.size(); i3++) {
            List<View> items2 = this.rowItems.valueAt(i3);
            List<WidgetTable.RowItem> rowItems = rows2.get(i3).getItems();
            for (int j2 = 0; j2 < items2.size(); j2++) {
                View textView4 = items2.get(j2);
                WidgetTable.RowItem rowItem = rowItems.get(j2);
                ImageSize image2 = rowItem.hasIcon() ? rowItem.getIcon().getImageByWidth(iconSize) : null;
                bindTextView(textView4, rowItem.getText(), image2, rowItem.getUrl(), hasIcons2, false);
            }
        }
    }

    private static TableRow.LayoutParams createRowLayoutParams(float weight) {
        int width = weight == 0.0f ? -2 : 0;
        return new TableRow.LayoutParams(width, V.dp(40.0f), weight);
    }

    private static View createTextViewWithImage(Context context, TableRow.LayoutParams layoutParams, String align) {
        LinearLayout.LayoutParams imageParams = new LinearLayout.LayoutParams(iconSize, iconSize);
        imageParams.setMargins(0, 0, V.dp(12.0f), 0);
        VKImageView imageView = new VKImageRoundedView(context);
        imageView.setLayoutParams(imageParams);
        imageView.setId(R.id.image1);
        TextView textView = createTextView(context, layoutParams, align, false, false);
        textView.setId(R.id.text1);
        LinearLayout layout = new LinearLayout(context);
        layout.setPadding(V.dp(6.0f), 0, 0, 0);
        layout.setGravity(16);
        layout.setLayoutParams(layoutParams);
        layout.setOrientation(0);
        layout.addView(imageView);
        layout.addView(textView);
        return layout;
    }

    private static TextView createTextView(Context context, TableRow.LayoutParams layoutParams, String align, boolean header, boolean withPadding) {
        TextView view = createTextView(context, header, withPadding);
        view.setLayoutParams(layoutParams);
        char c = 65535;
        switch (align.hashCode()) {
            case -1364013995:
                if (align.equals("center")) {
                    c = 0;
                    break;
                }
                break;
            case 3317767:
                if (align.equals("left")) {
                    c = 2;
                    break;
                }
                break;
            case 108511772:
                if (align.equals("right")) {
                    c = 1;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                view.setGravity(17);
                break;
            case 1:
                view.setGravity(21);
                break;
            default:
                view.setGravity(19);
                break;
        }
        return view;
    }

    private static TextView createTextView(Context context, boolean header, boolean withPadding) {
        TextView view = header ? new RobotoMediumTextView(context) : new TextView(context);
        view.setSingleLine();
        view.setTextSize(13.0f);
        view.setEllipsize(TextUtils.TruncateAt.END);
        view.setTextColor(context.getResources().getColor(R.color.cool_grey));
        if (withPadding) {
            view.setPadding(V.dp(6.0f), 0, V.dp(6.0f), 0);
        }
        return view;
    }

    private static void bindTextView(View view, String text, ImageSize icon, String url, boolean showIcon, boolean isHeader) {
        int color;
        int i;
        boolean isTextView = view instanceof TextView;
        VKImageView imageView = isTextView ? null : (VKImageView) view.findViewById(R.id.image1);
        TextView textView = isTextView ? (TextView) view : (TextView) view.findViewById(R.id.text1);
        textView.setText(text);
        if (isHeader) {
            color = textView.getContext().getResources().getColor(R.color.cool_grey);
        } else if (TextUtils.isEmpty(url)) {
            color = textView.getContext().getResources().getColor(R.color.dark_grey);
        } else {
            color = textView.getContext().getResources().getColor(R.color.brand_primary);
        }
        textView.setTextColor(color);
        if (TextUtils.isEmpty(url)) {
            view.setOnClickListener(null);
            view.setBackground(null);
        } else {
            view.setOnClickListener(WidgetTableView$$Lambda$1.lambdaFactory$(url));
            view.setBackgroundResource(R.drawable.highlight_post);
        }
        if (imageView != null) {
            if (icon == null) {
                i = showIcon ? 4 : 8;
            } else {
                i = 0;
            }
            imageView.setVisibility(i);
            if (icon == null) {
                imageView.setImageBitmap(null);
            } else {
                imageView.load(icon.getUrl());
            }
        }
    }

    /* loaded from: classes3.dex */
    public static class VKImageRoundedView extends VKImageView {
        public VKImageRoundedView(Context context) {
            super(context);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vk.imageloader.view.VKImageView, com.vk.imageloader.view.GenericVKImageView
        public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
            super.buildHierarchy(builder);
            builder.setRoundingParams(RoundingParams.fromCornersRadius(V.dp(2.0f)));
        }
    }
}
