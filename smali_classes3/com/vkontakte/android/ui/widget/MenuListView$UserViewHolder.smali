.class Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "MenuListView.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/MenuListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UserViewHolder"
.end annotation


# instance fields
.field private id:I

.field private online:Landroid/widget/ImageView;

.field private photo:Lcom/vk/imageloader/view/VKImageView;

.field private photoURL:Ljava/lang/String;

.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 3

    .prologue
    .line 1235
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    .line 1236
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0300ed

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 1237
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10019a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->title:Landroid/widget/TextView;

    .line 1238
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100199

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 1239
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100373

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->online:Landroid/widget/ImageView;

    .line 1240
    return-void
.end method


# virtual methods
.method public applyExpansion(Z)V
    .locals 7
    .param p1, "ignoreZero"    # Z

    .prologue
    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    .line 1285
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v2

    const v3, 0x3e99999a    # 0.3f

    sub-float/2addr v2, v3

    invoke-static {v5, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    const v3, 0x3f333333    # 0.7f

    div-float v1, v2, v3

    .line 1286
    .local v1, "titlesAlpha":F
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 1287
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1288
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v3

    sub-float v3, v6, v3

    const v4, 0x461c4000    # 10000.0f

    mul-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 1290
    :cond_0
    iget v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->id:I

    if-lez v2, :cond_4

    const/high16 v2, 0x42200000    # 40.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 1291
    .local v0, "offset":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v2

    cmpl-float v2, v2, v5

    if-nez v2, :cond_1

    if-eqz p1, :cond_2

    :cond_1
    if-eqz p1, :cond_3

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2400(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v2

    cmpl-float v2, v2, v5

    if-nez v2, :cond_3

    .line 1292
    :cond_2
    const/4 v0, 0x0

    .line 1294
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->itemView:Landroid/view/View;

    neg-int v3, v0

    int-to-float v3, v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v4

    sub-float v4, v6, v4

    mul-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 1295
    return-void

    .line 1290
    .end local v0    # "offset":I
    :cond_4
    const/high16 v2, 0x42a00000    # 80.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    goto :goto_0
.end method

.method public bind(Lcom/vkontakte/android/UserProfile;)V
    .locals 4
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    const/4 v1, 0x0

    .line 1243
    iget v0, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    iput v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->id:I

    .line 1244
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->title:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1245
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->photoURL:Ljava/lang/String;

    .line 1246
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->online:Landroid/widget/ImageView;

    iget v0, p1, Lcom/vkontakte/android/UserProfile;->online:I

    if-lez v0, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1247
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->online:Landroid/widget/ImageView;

    iget v0, p1, Lcom/vkontakte/android/UserProfile;->online:I

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2

    const v0, 0x7f020226

    :goto_1
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1248
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 1249
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2200(Lcom/vkontakte/android/ui/widget/MenuListView;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1250
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->applyExpansion(Z)V

    .line 1252
    :cond_0
    return-void

    .line 1246
    :cond_1
    const/4 v0, 0x4

    goto :goto_0

    .line 1247
    :cond_2
    const v0, 0x7f020227

    goto :goto_1
.end method

.method public bind(Lcom/vkontakte/android/api/Group;)V
    .locals 2
    .param p1, "group"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 1255
    iget v0, p1, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v0, v0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->id:I

    .line 1256
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->title:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1257
    iget-object v0, p1, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->photoURL:Ljava/lang/String;

    .line 1258
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->online:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1259
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p1, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 1260
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2200(Lcom/vkontakte/android/ui/widget/MenuListView;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1261
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->applyExpansion(Z)V

    .line 1263
    :cond_0
    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1267
    iget v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->id:I

    if-lez v0, :cond_0

    .line 1268
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->id:I

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onUserSelected(IZ)V

    .line 1272
    :goto_0
    return-void

    .line 1270
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->id:I

    neg-int v1, v1

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onCommunitySelected(IZ)V

    goto :goto_0
.end method

.method public onLongClick()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 1276
    iget v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->id:I

    if-lez v0, :cond_0

    .line 1277
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->id:I

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onUserSelected(IZ)V

    .line 1281
    :goto_0
    return v2

    .line 1279
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->id:I

    neg-int v1, v1

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onCommunitySelected(IZ)V

    goto :goto_0
.end method
