package com.facebook.drawee.view;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.net.Uri;
import android.util.AttributeSet;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Supplier;
import com.facebook.drawee.R;
import com.facebook.drawee.generic.GenericDraweeHierarchy;
import com.facebook.drawee.interfaces.DraweeController;
import com.facebook.drawee.interfaces.SimpleDraweeControllerBuilder;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class SimpleDraweeView extends GenericDraweeView {
    private static Supplier<? extends SimpleDraweeControllerBuilder> sDraweeControllerBuilderSupplier;
    private SimpleDraweeControllerBuilder mSimpleDraweeControllerBuilder;

    public static void initialize(Supplier<? extends SimpleDraweeControllerBuilder> draweeControllerBuilderSupplier) {
        sDraweeControllerBuilderSupplier = draweeControllerBuilderSupplier;
    }

    public static void shutDown() {
        sDraweeControllerBuilderSupplier = null;
    }

    public SimpleDraweeView(Context context, GenericDraweeHierarchy hierarchy) {
        super(context, hierarchy);
        init(context, null);
    }

    public SimpleDraweeView(Context context) {
        super(context);
        init(context, null);
    }

    public SimpleDraweeView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs);
    }

    public SimpleDraweeView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init(context, attrs);
    }

    @TargetApi(21)
    public SimpleDraweeView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init(context, attrs);
    }

    private void init(Context context, @Nullable AttributeSet attrs) {
        if (!isInEditMode()) {
            Preconditions.checkNotNull(sDraweeControllerBuilderSupplier, "SimpleDraweeView was not initialized!");
            this.mSimpleDraweeControllerBuilder = sDraweeControllerBuilderSupplier.mo486get();
            if (attrs != null) {
                TypedArray gdhAttrs = context.obtainStyledAttributes(attrs, R.styleable.SimpleDraweeView);
                try {
                    if (gdhAttrs.hasValue(R.styleable.SimpleDraweeView_actualImageUri)) {
                        setImageURI(Uri.parse(gdhAttrs.getString(R.styleable.SimpleDraweeView_actualImageUri)), (Object) null);
                    }
                } finally {
                    gdhAttrs.recycle();
                }
            }
        }
    }

    protected SimpleDraweeControllerBuilder getControllerBuilder() {
        return this.mSimpleDraweeControllerBuilder;
    }

    @Override // com.facebook.drawee.view.DraweeView, android.widget.ImageView
    public void setImageURI(Uri uri) {
        setImageURI(uri, (Object) null);
    }

    public void setImageURI(@Nullable String uriString) {
        setImageURI(uriString, (Object) null);
    }

    public void setImageURI(Uri uri, @Nullable Object callerContext) {
        DraweeController controller = this.mSimpleDraweeControllerBuilder.mo209setCallerContext(callerContext).mo205setUri(uri).mo210setOldController(getController()).mo208build();
        setController(controller);
    }

    public void setImageURI(@Nullable String uriString, @Nullable Object callerContext) {
        Uri uri = uriString != null ? Uri.parse(uriString) : null;
        setImageURI(uri, callerContext);
    }
}
