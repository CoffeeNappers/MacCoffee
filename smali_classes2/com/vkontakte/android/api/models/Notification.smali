.class public Lcom/vkontakte/android/api/models/Notification;
.super Lcom/vkontakte/android/api/models/Model;
.source "Notification.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/models/Notification$Activity;,
        Lcom/vkontakte/android/api/models/Notification$FeedbackType;,
        Lcom/vkontakte/android/api/models/Notification$ParentType;,
        Lcom/vkontakte/android/api/models/Notification$Type;
    }
.end annotation


# instance fields
.field public commentID:I

.field public commentUser:Lcom/vkontakte/android/UserProfile;

.field public date:I

.field private displayableText:Ljava/lang/CharSequence;

.field public feedBackUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field public grandParentPost:Lcom/vkontakte/android/NewsEntry;

.field public group:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/models/Notification;",
            ">;"
        }
    .end annotation
.end field

.field public id:I

.field public item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

.field public link:Ljava/lang/CharSequence;

.field public moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

.field public parentPost:Lcom/vkontakte/android/NewsEntry;

.field public stringDate:Ljava/lang/String;

.field public type:Lcom/vkontakte/android/api/models/Notification$Type;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    return-void
.end method

.method private static getAttachmentString()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 118
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0800de

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/api/models/Notification;->displayableText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/CharSequence;

    .prologue
    .line 91
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/api/models/Notification;->setText(Ljava/lang/CharSequence;Z)V

    .line 92
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;Z)V
    .locals 3
    .param p1, "t"    # Ljava/lang/CharSequence;
    .param p2, "hasAttach"    # Z

    .prologue
    .line 95
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 97
    :try_start_0
    invoke-static {p1}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/api/models/Notification;->displayableText:Ljava/lang/CharSequence;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    :goto_0
    if-eqz p2, :cond_0

    .line 103
    new-instance v0, Landroid/text/SpannableStringBuilder;

    iget-object v2, p0, Lcom/vkontakte/android/api/models/Notification;->displayableText:Ljava/lang/CharSequence;

    invoke-direct {v0, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 104
    .local v0, "builder":Landroid/text/SpannableStringBuilder;
    const-string/jumbo v2, "\n"

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 105
    invoke-static {}, Lcom/vkontakte/android/api/models/Notification;->getAttachmentString()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 106
    iput-object v0, p0, Lcom/vkontakte/android/api/models/Notification;->displayableText:Ljava/lang/CharSequence;

    .line 111
    .end local v0    # "builder":Landroid/text/SpannableStringBuilder;
    :cond_0
    :goto_1
    return-void

    .line 98
    :catch_0
    move-exception v1

    .line 99
    .local v1, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    invoke-static {v2, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 100
    iput-object p1, p0, Lcom/vkontakte/android/api/models/Notification;->displayableText:Ljava/lang/CharSequence;

    goto :goto_0

    .line 109
    .end local v1    # "x":Ljava/lang/Exception;
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/api/models/Notification;->getAttachmentString()Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/api/models/Notification;->displayableText:Ljava/lang/CharSequence;

    goto :goto_1
.end method
