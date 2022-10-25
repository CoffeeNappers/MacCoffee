.class Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "GraffitiFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/fragment/GraffitiFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GraffitiHolder"
.end annotation


# instance fields
.field private document:Lcom/vkontakte/android/api/Document;

.field final synthetic this$0:Lcom/vk/attachpicker/fragment/GraffitiFragment;


# direct methods
.method public constructor <init>(Lcom/vk/attachpicker/fragment/GraffitiFragment;Landroid/content/Context;)V
    .locals 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 264
    iput-object p1, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->this$0:Lcom/vk/attachpicker/fragment/GraffitiFragment;

    .line 265
    new-instance v1, Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {v1, p2}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v1}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 266
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->itemView:Landroid/view/View;

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    sget-object v2, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_CENTER:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setActualScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 267
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->itemView:Landroid/view/View;

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(F)V

    .line 268
    const/16 v1, 0x8

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    .line 269
    .local v0, "p":I
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 270
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/api/Document;)V
    .locals 3
    .param p1, "document"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 273
    iput-object p1, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->document:Lcom/vkontakte/android/api/Document;

    .line 274
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p1, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    sget-object v2, Lcom/vk/imageloader/ImageSize;->MID:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v0, v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 275
    return-void
.end method

.method synthetic lambda$onLongClick$0(Lcom/vkontakte/android/api/Document;Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "clickDoc"    # Lcom/vkontakte/android/api/Document;
    .param p2, "a"    # Landroid/app/Activity;
    .param p3, "dialog"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I

    .prologue
    .line 303
    if-nez p4, :cond_0

    .line 304
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesHideRecentGraffiti;

    iget v1, p1, Lcom/vkontakte/android/api/Document;->did:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesHideRecentGraffiti;-><init>(I)V

    new-instance v1, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder$1;-><init>(Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;Lcom/vkontakte/android/api/Document;Landroid/app/Activity;)V

    .line 305
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesHideRecentGraffiti;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 324
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 326
    :cond_0
    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 279
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->this$0:Lcom/vk/attachpicker/fragment/GraffitiFragment;

    invoke-virtual {v1}, Lcom/vk/attachpicker/fragment/GraffitiFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 280
    .local v0, "a":Landroid/app/Activity;
    if-nez v0, :cond_1

    .line 287
    :cond_0
    :goto_0
    return-void

    .line 284
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->document:Lcom/vkontakte/android/api/Document;

    if-eqz v1, :cond_0

    .line 285
    new-instance v1, Lcom/vk/attachpicker/GraffitiConfirmDialog;

    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->document:Lcom/vkontakte/android/api/Document;

    invoke-direct {v1, v0, v2}, Lcom/vk/attachpicker/GraffitiConfirmDialog;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/api/Document;)V

    invoke-virtual {v1}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->show()V

    goto :goto_0
.end method

.method public onLongClick()Z
    .locals 7

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 291
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->this$0:Lcom/vk/attachpicker/fragment/GraffitiFragment;

    invoke-virtual {v5}, Lcom/vk/attachpicker/fragment/GraffitiFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 292
    .local v0, "a":Landroid/app/Activity;
    if-nez v0, :cond_1

    .line 331
    :cond_0
    :goto_0
    return v3

    .line 296
    :cond_1
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->document:Lcom/vkontakte/android/api/Document;

    if-eqz v5, :cond_0

    .line 297
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;->document:Lcom/vkontakte/android/api/Document;

    .line 299
    .local v2, "clickDoc":Lcom/vkontakte/android/api/Document;
    new-instance v1, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 300
    .local v1, "builder":Landroid/support/v7/app/AlertDialog$Builder;
    new-array v5, v4, [Ljava/lang/String;

    const v6, 0x7f08019c

    .line 301
    invoke-virtual {v0, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {p0, v2, v0}, Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/fragment/GraffitiFragment$GraffitiHolder;Lcom/vkontakte/android/api/Document;Landroid/app/Activity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    .line 300
    invoke-virtual {v1, v5, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 327
    invoke-virtual {v1}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    move v3, v4

    .line 329
    goto :goto_0
.end method
