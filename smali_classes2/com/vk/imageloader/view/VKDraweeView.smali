.class public Lcom/vk/imageloader/view/VKDraweeView;
.super Landroid/widget/ImageView;
.source "VKDraweeView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<DH::",
        "Lcom/facebook/drawee/interfaces/DraweeHierarchy;",
        ">",
        "Landroid/widget/ImageView;"
    }
.end annotation


# instance fields
.field private mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/drawee/view/DraweeHolder",
            "<TDH;>;"
        }
    .end annotation
.end field

.field private mInitialised:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mInitialised:Z

    .line 27
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKDraweeView;->init(Landroid/content/Context;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 31
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mInitialised:Z

    .line 32
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKDraweeView;->init(Landroid/content/Context;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 36
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mInitialised:Z

    .line 37
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKDraweeView;->init(Landroid/content/Context;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mInitialised:Z

    .line 43
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKDraweeView;->init(Landroid/content/Context;)V

    .line 44
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-boolean v1, p0, Lcom/vk/imageloader/view/VKDraweeView;->mInitialised:Z

    if-eqz v1, :cond_1

    .line 62
    :cond_0
    :goto_0
    return-void

    .line 53
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vk/imageloader/view/VKDraweeView;->mInitialised:Z

    .line 54
    const/4 v1, 0x0

    invoke-static {v1, p1}, Lcom/facebook/drawee/view/DraweeHolder;->create(Lcom/facebook/drawee/interfaces/DraweeHierarchy;Landroid/content/Context;)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    .line 55
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 56
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKDraweeView;->getImageTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 57
    .local v0, "imageTintList":Landroid/content/res/ColorStateList;
    if-eqz v0, :cond_0

    .line 60
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/vk/imageloader/view/VKDraweeView;->setColorFilter(I)V

    goto :goto_0
.end method


# virtual methods
.method protected doAttach()V
    .locals 1

    .prologue
    .line 161
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->onAttach()V

    .line 162
    return-void
.end method

.method protected doDetach()V
    .locals 1

    .prologue
    .line 170
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->onDetach()V

    .line 171
    return-void
.end method

.method public getController()Lcom/facebook/drawee/interfaces/DraweeController;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 107
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getController()Lcom/facebook/drawee/interfaces/DraweeController;

    move-result-object v0

    return-object v0
.end method

.method public getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TDH;"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    return-object v0
.end method

.method public getTopLevelDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public hasController()Z
    .locals 1

    .prologue
    .line 114
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getController()Lcom/facebook/drawee/interfaces/DraweeController;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasHierarchy()Z
    .locals 1

    .prologue
    .line 83
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->hasHierarchy()Z

    move-result v0

    return v0
.end method

.method protected onAttach()V
    .locals 0

    .prologue
    .line 145
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKDraweeView;->doAttach()V

    .line 146
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .prologue
    .line 119
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    .line 120
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKDraweeView;->onAttach()V

    .line 121
    return-void
.end method

.method protected onDetach()V
    .locals 0

    .prologue
    .line 152
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKDraweeView;->doDetach()V

    .line 153
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 125
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 126
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKDraweeView;->onDetach()V

    .line 127
    return-void
.end method

.method public onFinishTemporaryDetach()V
    .locals 0

    .prologue
    .line 137
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-super {p0}, Landroid/widget/ImageView;->onFinishTemporaryDetach()V

    .line 138
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKDraweeView;->onAttach()V

    .line 139
    return-void
.end method

.method public onStartTemporaryDetach()V
    .locals 0

    .prologue
    .line 131
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-super {p0}, Landroid/widget/ImageView;->onStartTemporaryDetach()V

    .line 132
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKDraweeView;->onDetach()V

    .line 133
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 175
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/DraweeHolder;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    const/4 v0, 0x1

    .line 178
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public setController(Lcom/facebook/drawee/interfaces/DraweeController;)V
    .locals 1
    .param p1, "draweeController"    # Lcom/facebook/drawee/interfaces/DraweeController;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 98
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/DraweeHolder;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 99
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 100
    return-void
.end method

.method public setHierarchy(Lcom/facebook/drawee/interfaces/DraweeHierarchy;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TDH;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    .local p1, "hierarchy":Lcom/facebook/drawee/interfaces/DraweeHierarchy;, "TDH;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/DraweeHolder;->setHierarchy(Lcom/facebook/drawee/interfaces/DraweeHierarchy;)V

    .line 69
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 70
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    .line 189
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeHolder;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 190
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 191
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 183
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeHolder;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 184
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 185
    return-void
.end method

.method public setImageResource(I)V
    .locals 2
    .param p1, "resId"    # I

    .prologue
    .line 195
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeHolder;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 196
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 197
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 201
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeHolder;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 202
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 203
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 207
    .local p0, "this":Lcom/vk/imageloader/view/VKDraweeView;, "Lcom/vk/imageloader/view/VKDraweeView<TDH;>;"
    invoke-static {p0}, Lcom/facebook/common/internal/Objects;->toStringHelper(Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v1

    const-string/jumbo v2, "holder"

    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/imageloader/view/VKDraweeView;->mDraweeHolder:Lcom/facebook/drawee/view/DraweeHolder;

    .line 208
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeHolder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v2, v0}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 209
    invoke-virtual {v0}, Lcom/facebook/common/internal/Objects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 208
    :cond_0
    const-string/jumbo v0, "<no holder set>"

    goto :goto_0
.end method
