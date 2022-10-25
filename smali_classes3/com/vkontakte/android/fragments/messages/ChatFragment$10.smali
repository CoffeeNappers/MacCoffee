.class Lcom/vkontakte/android/fragments/messages/ChatFragment$10;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateOnline(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1594
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$10;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;)V
    .locals 10
    .param p1, "res"    # Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1597
    iget v4, p1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;->time:I

    if-lez v4, :cond_2

    iget v4, p1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;->online:I

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$10;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 1598
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$10;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-boolean v4, p1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;->f:Z

    if-eqz v4, :cond_1

    const v4, 0x7f080329

    :goto_0
    new-array v6, v9, [Ljava/lang/Object;

    iget v7, p1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;->time:I

    invoke-static {v7}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v5, v4, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1599
    .local v2, "lastSeen":Ljava/lang/CharSequence;
    iget-boolean v4, p1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;->mobile:Z

    if-eqz v4, :cond_0

    .line 1600
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1601
    .local v0, "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v4

    const-string/jumbo v5, "F"

    invoke-virtual {v4, v5}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v3

    .line 1602
    .local v3, "sp":Landroid/text/Spannable;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$10;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0201d6

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1603
    .local v1, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    invoke-virtual {v1, v8, v8, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1604
    new-instance v4, Landroid/text/style/ImageSpan;

    invoke-direct {v4, v1, v9}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v3, v4, v8, v9, v8}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1605
    const-string/jumbo v4, "\u00a0"

    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1606
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1607
    move-object v2, v0

    .line 1609
    .end local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    .end local v3    # "sp":Landroid/text/Spannable;
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$10;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v4, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 1613
    .end local v2    # "lastSeen":Ljava/lang/CharSequence;
    :goto_1
    return-void

    .line 1598
    :cond_1
    const v4, 0x7f08032a

    goto :goto_0

    .line 1611
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$10;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$10;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget v6, p1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;->online:I

    invoke-static {v5, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5400(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setSubtitle(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1594
    check-cast p1, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$10;->success(Lcom/vkontakte/android/api/messages/MessagesGetLastActivity$Result;)V

    return-void
.end method
