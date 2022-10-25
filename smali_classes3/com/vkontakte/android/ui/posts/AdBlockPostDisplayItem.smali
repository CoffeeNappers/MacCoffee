.class abstract Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "AdBlockPostDisplayItem.java"


# static fields
.field static final dividerDrawable:Landroid/graphics/drawable/Drawable;


# instance fields
.field public post:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    new-instance v0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$1;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->dividerDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "_post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 91
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    .line 92
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Lcom/vkontakte/android/attachments/ShitAttachment;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->doHide(Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    return-void
.end method

.method static cleanScroll(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1
    .param p0, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 158
    if-eqz p0, :cond_0

    .line 159
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    .line 161
    :cond_0
    return-void
.end method

.method static cleanScroll(Landroid/widget/HorizontalScrollView;)V
    .locals 1
    .param p0, "horizontalScrollView"    # Landroid/widget/HorizontalScrollView;

    .prologue
    const/4 v0, 0x0

    .line 152
    if-eqz p0, :cond_0

    .line 153
    invoke-virtual {p0, v0, v0}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    .line 155
    :cond_0
    return-void
.end method

.method private doHide(Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "a"    # Lcom/vkontakte/android/attachments/ShitAttachment;

    .prologue
    .line 123
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 124
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.POST_DELETED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "post_id"

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 126
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 127
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    .line 124
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 139
    :goto_0
    return-void

    .line 131
    :cond_0
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/NewsEntry;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 132
    .local v0, "newPost":Lcom/vkontakte/android/NewsEntry;
    iget-object v1, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 134
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.POST_REPLACED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "entry"

    .line 135
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    .line 134
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private showDebug(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 142
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 143
    .local v0, "wv":Landroid/webkit/WebView;
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "ads_debug"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "text/html;charset=utf-8"

    invoke-virtual {v0, v1, v2, v3}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v1, p1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string/jumbo v2, "Ads Debug"

    .line 145
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 146
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080149

    .line 147
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 148
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 149
    return-void
.end method


# virtual methods
.method protected hide(Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "a"    # Lcom/vkontakte/android/attachments/ShitAttachment;

    .prologue
    .line 95
    new-instance v0, Lcom/vkontakte/android/api/adsint/AdsintHideAd;

    iget-object v1, p2, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    sget-object v2, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;->ad:Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/adsint/AdsintHideAd;-><init>(Ljava/lang/String;Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;)V

    new-instance v1, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$2;-><init>(Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/adsint/AdsintHideAd;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 100
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 101
    return-void
.end method

.method synthetic lambda$onMenuClicked$0(Landroid/view/View;Lcom/vkontakte/android/attachments/ShitAttachment;Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "a"    # Lcom/vkontakte/android/attachments/ShitAttachment;
    .param p3, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 71
    invoke-interface {p3}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 84
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 73
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->hide(Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    goto :goto_0

    .line 76
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->report(Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    goto :goto_0

    .line 79
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->showDebug(Landroid/content/Context;)V

    goto :goto_0

    .line 71
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method onItemClicked(Lcom/vkontakte/android/attachments/ShitAttachment;Landroid/view/View;)V
    .locals 2
    .param p1, "ad"    # Lcom/vkontakte/android/attachments/ShitAttachment;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 59
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 60
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    invoke-static {v0, p1}, Lcom/vkontakte/android/utils/AdsUtil;->onAdsPostClick(Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 61
    :cond_0
    return-void
.end method

.method onMenuClicked(Lcom/vkontakte/android/attachments/ShitAttachment;Landroid/view/View;)V
    .locals 5
    .param p1, "a"    # Lcom/vkontakte/android/attachments/ShitAttachment;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 64
    new-instance v0, Landroid/support/v7/widget/PopupMenu;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Landroid/support/v7/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 65
    .local v0, "pm":Landroid/support/v7/widget/PopupMenu;
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f080306

    invoke-interface {v1, v4, v4, v4, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 66
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const/4 v2, 0x1

    const v3, 0x7f0805bd

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 67
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "ads_debug"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 68
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const/4 v2, 0x2

    const-string/jumbo v3, "ads_debug"

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 70
    :cond_0
    invoke-static {p0, p2, p1}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;Landroid/view/View;Lcom/vkontakte/android/attachments/ShitAttachment;)Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 86
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->show()V

    .line 87
    return-void
.end method

.method protected report(Landroid/content/Context;Lcom/vkontakte/android/attachments/ShitAttachment;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "a"    # Lcom/vkontakte/android/attachments/ShitAttachment;

    .prologue
    .line 105
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/ReportContentActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 106
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "adAttachment"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 107
    const-string/jumbo v1, "newsEntry"

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 108
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    return-void
.end method
