.class Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$4;
.super Ljava/lang/Object;
.source "NotificationPostDisplayItemGallery.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->configureNewPost(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    .prologue
    .line 281
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$4;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 293
    invoke-static {p1}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 294
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 284
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 1
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 288
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$4;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->access$100(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V

    .line 289
    return-void
.end method
