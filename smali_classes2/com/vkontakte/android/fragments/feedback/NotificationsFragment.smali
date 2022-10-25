.class public Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;
.super Lcom/vkontakte/android/fragments/base/GridFragment;
.source "NotificationsFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;,
        Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$ExpandTextClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/api/models/Notification;",
        ">;"
    }
.end annotation


# instance fields
.field private adapter:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;

.field private foundDividers:Z

.field private from:Ljava/lang/String;

.field private langInfo:[[[Ljava/lang/String;

.field private mNotificationAction:Lcom/vkontakte/android/functions/VoidF1Int;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1Int",
            "<",
            "Lcom/vkontakte/android/api/models/Notification;",
            ">;"
        }
    .end annotation
.end field

.field private mUserAction:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 116
    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/GridFragment;-><init>(I)V

    .line 69
    invoke-static {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->mUserAction:Lcom/vkontakte/android/functions/VoidF1;

    .line 73
    invoke-static {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/functions/VoidF1Int;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->mNotificationAction:Lcom/vkontakte/android/functions/VoidF1Int;

    .line 117
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->refreshing:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->from:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->foundDividers:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->isTablet:Z

    return v0
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;Lcom/vkontakte/android/api/models/Notification;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/models/Notification;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->attachExpandListeners(Lcom/vkontakte/android/api/models/Notification;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->refresh()V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->adapter:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->mUserAction:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/functions/VoidF1Int;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->mNotificationAction:Lcom/vkontakte/android/functions/VoidF1Int;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)[[[Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->langInfo:[[[Ljava/lang/String;

    return-object v0
.end method

.method private attachExpandListeners(Lcom/vkontakte/android/api/models/Notification;)V
    .locals 6
    .param p1, "item"    # Lcom/vkontakte/android/api/models/Notification;

    .prologue
    const/4 v5, 0x0

    .line 288
    iget-object v2, p1, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    instance-of v2, v2, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    if-eqz v2, :cond_0

    .line 289
    iget-object v1, p1, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    check-cast v1, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    .line 290
    .local v1, "text":Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;
    iget-object v2, v1, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    instance-of v2, v2, Landroid/text/Spannable;

    if-eqz v2, :cond_0

    .line 291
    iget-object v2, v1, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    check-cast v2, Landroid/text/Spannable;

    iget-object v3, v1, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    const-class v4, Lcom/vkontakte/android/ExpandTextSpan;

    invoke-interface {v2, v5, v3, v4}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/ExpandTextSpan;

    .line 292
    .local v0, "spans":[Lcom/vkontakte/android/ExpandTextSpan;
    array-length v2, v0

    if-lez v2, :cond_0

    .line 293
    aget-object v2, v0, v5

    new-instance v3, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$ExpandTextClickListener;

    invoke-direct {v3, p0, p1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$ExpandTextClickListener;-><init>(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;Lcom/vkontakte/android/api/models/Notification;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ExpandTextSpan;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    .end local v0    # "spans":[Lcom/vkontakte/android/ExpandTextSpan;
    .end local v1    # "text":Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;
    :cond_0
    return-void
.end method

.method public static ensureMoneyTransferNotificationsAreEnabledOnce()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 314
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2, v6, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "money_transfers_notifications_enabled_once"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_1

    .line 316
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2, v6, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "notifications_filter"

    const-string/jumbo v4, "wall,mentions,comments,likes,reposts,followers|friends"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 317
    .local v0, "_setting":[Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 318
    .local v1, "setting":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {v1, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 320
    const-string/jumbo v2, "money_transfers"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 321
    const-string/jumbo v2, "money_transfers"

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 323
    :cond_0
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2, v6, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "notifications_filter"

    const-string/jumbo v4, ","

    invoke-static {v4, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "money_transfers_notifications_enabled_once"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 325
    :cond_1
    return-void
.end method

.method static synthetic lambda$showFilterDialog$3([ZLandroid/content/DialogInterface;IZ)V
    .locals 0
    .param p0, "values"    # [Z
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I
    .param p3, "isChecked"    # Z

    .prologue
    .line 358
    aput-boolean p3, p0, p2

    .line 359
    return-void
.end method

.method private showFilterDialog()V
    .locals 14

    .prologue
    const/4 v13, 0x4

    const/4 v12, 0x3

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 328
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->isAdded()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 330
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    iget-boolean v3, v7, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersAvailable:Z

    .line 332
    .local v3, "moneyTransfersEnabled":Z
    if-eqz v3, :cond_0

    .line 333
    invoke-static {}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->ensureMoneyTransferNotificationsAreEnabledOnce()V

    .line 336
    :cond_0
    if-eqz v3, :cond_1

    const/4 v7, 0x7

    new-array v2, v7, [Ljava/lang/String;

    const-string/jumbo v7, "wall"

    aput-object v7, v2, v9

    const-string/jumbo v7, "mentions"

    aput-object v7, v2, v10

    const-string/jumbo v7, "comments"

    aput-object v7, v2, v11

    const-string/jumbo v7, "likes"

    aput-object v7, v2, v12

    const-string/jumbo v7, "reposts"

    aput-object v7, v2, v13

    const/4 v7, 0x5

    const-string/jumbo v8, "followers|friends"

    aput-object v8, v2, v7

    const/4 v7, 0x6

    const-string/jumbo v8, "money_transfers"

    aput-object v8, v2, v7

    .line 339
    .local v2, "keys":[Ljava/lang/String;
    :goto_0
    const/4 v4, 0x0

    .line 340
    .local v4, "opts":[Ljava/lang/String;
    if-nez v3, :cond_2

    .line 341
    const/4 v7, 0x6

    new-array v4, v7, [Ljava/lang/String;

    .end local v4    # "opts":[Ljava/lang/String;
    const v7, 0x7f08077d

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v9

    const v7, 0x7f080355

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v10

    const v7, 0x7f08015a

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v11

    const v7, 0x7f080338

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v12

    const v7, 0x7f0805d1

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v13

    const/4 v7, 0x5

    const v8, 0x7f08021e

    invoke-virtual {p0, v8}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v7

    .line 347
    .restart local v4    # "opts":[Ljava/lang/String;
    :goto_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    const-string/jumbo v8, "notifications_filter"

    const-string/jumbo v9, "wall,mentions,comments,likes,reposts,followers|friends"

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 348
    .local v0, "_setting":[Ljava/lang/String;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 349
    .local v5, "setting":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {v5, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 351
    array-length v7, v2

    new-array v6, v7, [Z

    .line 352
    .local v6, "values":[Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    array-length v7, v6

    if-ge v1, v7, :cond_3

    .line 353
    aget-object v7, v2, v1

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    aput-boolean v7, v6, v1

    .line 352
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 336
    .end local v0    # "_setting":[Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "keys":[Ljava/lang/String;
    .end local v4    # "opts":[Ljava/lang/String;
    .end local v5    # "setting":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "values":[Z
    :cond_1
    const/4 v7, 0x6

    new-array v2, v7, [Ljava/lang/String;

    const-string/jumbo v7, "wall"

    aput-object v7, v2, v9

    const-string/jumbo v7, "mentions"

    aput-object v7, v2, v10

    const-string/jumbo v7, "comments"

    aput-object v7, v2, v11

    const-string/jumbo v7, "likes"

    aput-object v7, v2, v12

    const-string/jumbo v7, "reposts"

    aput-object v7, v2, v13

    const/4 v7, 0x5

    const-string/jumbo v8, "followers|friends"

    aput-object v8, v2, v7

    goto/16 :goto_0

    .line 344
    .restart local v2    # "keys":[Ljava/lang/String;
    .restart local v4    # "opts":[Ljava/lang/String;
    :cond_2
    const/4 v7, 0x7

    new-array v4, v7, [Ljava/lang/String;

    .end local v4    # "opts":[Ljava/lang/String;
    const v7, 0x7f08077d

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v9

    const v7, 0x7f080355

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v10

    const v7, 0x7f08015a

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v11

    const v7, 0x7f080338

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v12

    const v7, 0x7f0805d1

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v13

    const/4 v7, 0x5

    const v8, 0x7f08021e

    invoke-virtual {p0, v8}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v7

    const/4 v7, 0x6

    const v8, 0x7f08036d

    invoke-virtual {p0, v8}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v7

    .restart local v4    # "opts":[Ljava/lang/String;
    goto/16 :goto_1

    .line 355
    .restart local v0    # "_setting":[Ljava/lang/String;
    .restart local v1    # "i":I
    .restart local v5    # "setting":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v6    # "values":[Z
    :cond_3
    new-instance v7, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v8, 0x7f080219

    .line 356
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    invoke-static {v6}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$4;->lambdaFactory$([Z)Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    move-result-object v8

    .line 357
    invoke-virtual {v7, v4, v6, v8}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f080479

    invoke-static {p0, v6, v2}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;[Z[Ljava/lang/String;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v9

    .line 360
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f08011f

    const/4 v9, 0x0

    .line 372
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 373
    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 375
    .end local v0    # "_setting":[Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "keys":[Ljava/lang/String;
    .end local v3    # "moneyTransfersEnabled":Z
    .end local v4    # "opts":[Ljava/lang/String;
    .end local v5    # "setting":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "values":[Z
    :cond_4
    return-void
.end method


# virtual methods
.method protected createAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/GridFragment",
            "<",
            "Lcom/vkontakte/android/api/models/Notification;",
            ">.GridAdapter<*>;"
        }
    .end annotation

    .prologue
    .line 302
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;-><init>(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->adapter:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;

    .line 303
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->adapter:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->setHasStableIds(Z)V

    .line 304
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->adapter:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 6
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 158
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_1

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNotifications()I

    move-result v3

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->refreshing:Z

    if-nez v3, :cond_1

    move v0, v1

    .line 159
    .local v0, "fromCache":Z
    :goto_0
    new-instance v4, Lcom/vkontakte/android/api/notifications/NotificationsGet;

    if-eqz p1, :cond_0

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->refreshing:Z

    if-eqz v3, :cond_2

    :cond_0
    const-string/jumbo v3, ""

    :goto_1
    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->refreshing:Z

    if-nez v5, :cond_3

    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->foundDividers:Z

    if-eqz v5, :cond_3

    :goto_2
    invoke-direct {v4, v3, p2, v0, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;-><init>(Ljava/lang/String;IZZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$1;

    invoke-direct {v1, p0, p0, v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$1;-><init>(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;Landroid/app/Fragment;Z)V

    .line 160
    invoke-virtual {v4, v1}, Lcom/vkontakte/android/api/notifications/NotificationsGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 190
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 191
    return-void

    .end local v0    # "fromCache":Z
    :cond_1
    move v0, v2

    .line 158
    goto :goto_0

    .line 159
    .restart local v0    # "fromCache":Z
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->from:Ljava/lang/String;

    goto :goto_1

    :cond_3
    move v1, v2

    goto :goto_2
.end method

.method protected getColumnsCount()I
    .locals 1

    .prologue
    .line 309
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$new$0(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 70
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 71
    return-void
.end method

.method synthetic lambda$new$1(Lcom/vkontakte/android/api/models/Notification;I)V
    .locals 7
    .param p1, "notification"    # Lcom/vkontakte/android/api/models/Notification;
    .param p2, "position"    # I

    .prologue
    const/4 v5, 0x4

    .line 74
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    sget-object v4, Lcom/vkontakte/android/api/models/Notification$Type;->Grouped:Lcom/vkontakte/android/api/models/Notification$Type;

    if-ne v3, v4, :cond_1

    if-ltz p2, :cond_1

    .line 75
    iget-object v1, p1, Lcom/vkontakte/android/api/models/Notification;->group:Ljava/util/List;

    check-cast v1, Ljava/util/ArrayList;

    .line 76
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/models/Notification;>;"
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 77
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v3, p2, v1}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 78
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->adapter:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->notifyDataSetChanged()V

    .line 113
    .end local v1    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/models/Notification;>;"
    :cond_0
    :goto_0
    return-void

    .line 81
    :cond_1
    iget-object v2, p1, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    .line 82
    .local v2, "parent":Lcom/vkontakte/android/NewsEntry;
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    sget-object v4, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferAccepted:Lcom/vkontakte/android/api/models/Notification$Type;

    if-eq v3, v4, :cond_2

    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    sget-object v4, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferDeclined:Lcom/vkontakte/android/api/models/Notification$Type;

    if-eq v3, v4, :cond_2

    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    sget-object v4, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferReceived:Lcom/vkontakte/android/api/models/Notification$Type;

    if-ne v3, v4, :cond_3

    .line 86
    :cond_2
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    iget v3, v3, Lcom/vkontakte/android/MoneyTransfer;->id:I

    iget-object v4, p1, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    iget v4, v4, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    iget-object v5, p1, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    iget v5, v5, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-static {v3, v4, v5, v6}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->show(IIILandroid/content/Context;)V

    goto :goto_0

    .line 88
    :cond_3
    if-nez v2, :cond_4

    .line 89
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    if-eqz v3, :cond_0

    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 90
    new-instance v4, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v4, v3}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 92
    :cond_4
    iget v3, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v4, 0x12

    if-ne v3, v4, :cond_5

    .line 93
    new-instance v3, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;

    sget-object v4, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;->feed:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v6, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-direct {v3, v4, v5, v6}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;-><init>(Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;II)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 94
    :cond_5
    iget v3, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v3, v5, :cond_6

    .line 95
    new-instance v3, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    iget v4, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v5, v5

    iget-object v6, v2, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v6}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;-><init>(IILjava/lang/String;)V

    iget v4, v2, Lcom/vkontakte/android/NewsEntry;->numComments:I

    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->numComments:I

    rem-int/lit8 v5, v5, 0x14

    sub-int/2addr v4, v5

    .line 96
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->setOffset(I)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 97
    :cond_6
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    if-eqz v3, :cond_7

    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v3, v5, :cond_7

    .line 98
    new-instance v3, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    iget-object v4, p1, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v5, p1, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v5, v5

    iget-object v6, p1, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    iget-object v6, v6, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v6}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;-><init>(IILjava/lang/String;)V

    iget-object v4, p1, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->numComments:I

    iget-object v5, p1, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->numComments:I

    rem-int/lit8 v5, v5, 0x14

    sub-int/2addr v4, v5

    .line 100
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->setOffset(I)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    move-result-object v3

    .line 101
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 103
    :cond_7
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    if-eqz v3, :cond_a

    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->grandParentPost:Lcom/vkontakte/android/NewsEntry;

    :goto_1
    invoke-direct {v0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 105
    .local v0, "builder":Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v3, v3, Lcom/vkontakte/android/api/models/Notification$Type;->parentType:Lcom/vkontakte/android/api/models/Notification$ParentType;

    sget-object v4, Lcom/vkontakte/android/api/models/Notification$ParentType;->Comment:Lcom/vkontakte/android/api/models/Notification$ParentType;

    if-ne v3, v4, :cond_8

    .line 106
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setComment(I)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    .line 108
    :cond_8
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v3, v3, Lcom/vkontakte/android/api/models/Notification$Type;->feedbackType:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    sget-object v4, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Comment:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    if-ne v3, v4, :cond_9

    .line 109
    iget v3, p1, Lcom/vkontakte/android/api/models/Notification;->commentID:I

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setComment(I)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    .line 111
    :cond_9
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 103
    .end local v0    # "builder":Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    :cond_a
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    goto :goto_1
.end method

.method synthetic lambda$onViewCreated$2(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 10
    .param p1, "child"    # Landroid/view/View;
    .param p2, "outRect"    # Landroid/graphics/Rect;

    .prologue
    .line 229
    iget-object v6, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6, p1}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v5

    .line 230
    .local v5, "rawHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    instance-of v6, v5, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    if-nez v6, :cond_1

    .line 231
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v6

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v7

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v8

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v9

    invoke-virtual {p2, v6, v7, v8, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 252
    :cond_0
    return-void

    :cond_1
    move-object v0, v5

    .line 234
    check-cast v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    .line 235
    .local v0, "currentHolder":Lcom/vkontakte/android/fragments/feedback/TempPostHolder;
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v6

    iput v6, p2, Landroid/graphics/Rect;->left:I

    .line 236
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v6

    iput v6, p2, Landroid/graphics/Rect;->right:I

    .line 238
    const/4 v1, 0x0

    .line 239
    .local v1, "foundFirst":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget-object v6, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v6

    if-ge v4, v6, :cond_0

    .line 240
    iget-object v6, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v6, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v3

    .line 241
    .local v3, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    instance-of v6, v3, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    if-eqz v6, :cond_3

    move-object v2, v3

    .line 242
    check-cast v2, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    .line 243
    .local v2, "h":Lcom/vkontakte/android/fragments/feedback/TempPostHolder;
    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;->getItem()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/api/models/Notification;

    iget-object v6, v6, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v7, v6, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;->getItem()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/api/models/Notification;

    iget-object v6, v6, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v6, v6, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    if-ne v7, v6, :cond_3

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;->getItem()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/api/models/Notification;

    iget-object v6, v6, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v7, v6, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;->getItem()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/api/models/Notification;

    iget-object v6, v6, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v6, v6, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    if-ne v7, v6, :cond_3

    .line 244
    if-nez v1, :cond_2

    .line 245
    const/4 v1, 0x1

    .line 246
    iget-object v6, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v6

    iput v6, p2, Landroid/graphics/Rect;->top:I

    .line 248
    :cond_2
    iget-object v6, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v6

    iput v6, p2, Landroid/graphics/Rect;->bottom:I

    .line 239
    .end local v2    # "h":Lcom/vkontakte/android/fragments/feedback/TempPostHolder;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method synthetic lambda$showFilterDialog$4([Z[Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "values"    # [Z
    .param p2, "keys"    # [Ljava/lang/String;
    .param p3, "dialog"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I

    .prologue
    .line 361
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->isAdded()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 362
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 363
    .local v1, "sett":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_1

    .line 364
    aget-boolean v2, p1, v0

    if-eqz v2, :cond_0

    .line 365
    aget-object v2, p2, v0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 363
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 368
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "notifications_filter"

    const-string/jumbo v4, ","

    invoke-static {v4, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 369
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->reload()V

    .line 371
    .end local v0    # "i":I
    .end local v1    # "sett":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 195
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 196
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 197
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->loadData()V

    .line 201
    :goto_0
    return-void

    .line 199
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->dataLoaded()V

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 121
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onAttach(Landroid/app/Activity;)V

    .line 122
    const v0, 0x7f080453

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->setEmptyText(I)V

    .line 123
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 127
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCreate(Landroid/os/Bundle;)V

    .line 128
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->setHasOptionsMenu(Z)V

    .line 129
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->setRefreshEnabled(Z)V

    .line 130
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v5}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "like_notifications"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 132
    const/4 v0, 0x4

    new-array v0, v0, [[[Ljava/lang/String;

    new-array v1, v7, [[Ljava/lang/String;

    .line 134
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c001f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    .line 135
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c001e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    .line 136
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0020

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    aput-object v1, v0, v5

    new-array v1, v7, [[Ljava/lang/String;

    .line 139
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0022

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    .line 140
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0021

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    .line 141
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0023

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    aput-object v1, v0, v4

    new-array v1, v7, [[Ljava/lang/String;

    .line 144
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c001c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    .line 145
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c001b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    .line 146
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c001d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    aput-object v1, v0, v6

    new-array v1, v7, [[Ljava/lang/String;

    .line 149
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0019

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    .line 150
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0018

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    .line 151
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c001a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    aput-object v1, v0, v7

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->langInfo:[[[Ljava/lang/String;

    .line 154
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .locals 9

    .prologue
    const/4 v4, 0x1

    const/high16 v8, 0x41100000    # 9.0f

    const/4 v5, 0x0

    .line 263
    iget-object v6, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-nez v6, :cond_0

    .line 264
    const/4 v0, 0x0

    .line 282
    :goto_0
    return-object v0

    .line 266
    :cond_0
    iget v6, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->scrW:I

    const/16 v7, 0x39c

    if-lt v6, v7, :cond_1

    move v1, v4

    .line 268
    .local v1, "isTabletDecorator":Z
    :goto_1
    new-instance v0, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v6

    if-nez v1, :cond_2

    :goto_2
    invoke-direct {v0, v6, v4}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;Z)V

    .line 270
    .local v0, "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    iget v4, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->scrW:I

    const/16 v6, 0x258

    if-lt v4, v6, :cond_3

    .line 271
    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .line 278
    .local v3, "paddingTop":I
    :goto_3
    if-eqz v1, :cond_5

    const/16 v4, 0x10

    iget v6, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->scrW:I

    add-int/lit16 v6, v6, -0x39c

    div-int/lit8 v6, v6, 0x2

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .line 279
    invoke-virtual {v0}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->getShadowSize()F

    move-result v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    float-to-int v6, v6

    add-int v2, v4, v6

    .line 280
    .local v2, "margin":I
    :goto_4
    iget-object v4, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4, v2, v3, v2, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 281
    invoke-virtual {v0, v5, v5, v5, v5}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setPadding(IIII)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    goto :goto_0

    .end local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .end local v1    # "isTabletDecorator":Z
    .end local v2    # "margin":I
    .end local v3    # "paddingTop":I
    :cond_1
    move v1, v5

    .line 266
    goto :goto_1

    .restart local v1    # "isTabletDecorator":Z
    :cond_2
    move v4, v5

    .line 268
    goto :goto_2

    .line 272
    .restart local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    :cond_3
    iget v4, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->scrW:I

    const/16 v6, 0x1e0

    if-lt v4, v6, :cond_4

    .line 273
    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .restart local v3    # "paddingTop":I
    goto :goto_3

    .line 275
    .end local v3    # "paddingTop":I
    :cond_4
    const/high16 v4, 0x41000000    # 8.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .restart local v3    # "paddingTop":I
    goto :goto_3

    :cond_5
    move v2, v5

    .line 279
    goto :goto_4
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 205
    const v0, 0x7f1005fd

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-nez v0, :cond_0

    .line 206
    const v0, 0x7f110010

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 208
    :cond_0
    return-void
.end method

.method protected onDataLoaded(Ljava/util/List;Z)V
    .locals 0
    .param p2, "more"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/models/Notification;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 257
    .local p1, "d":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/models/Notification;>;"
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 258
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->updateDecorator()V

    .line 259
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 212
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f1005fd

    if-ne v0, v1, :cond_0

    .line 213
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->showFilterDialog()V

    .line 214
    const/4 v0, 0x1

    .line 216
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 221
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 222
    iget-object v7, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v0, Lme/grishka/appkit/views/DividerItemDecoration;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v2, 0x26000000

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->isTablet:Z

    if-eqz v3, :cond_0

    move-object v3, v5

    :goto_0
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->isTablet:Z

    if-eqz v4, :cond_1

    move v4, v6

    .line 223
    :goto_1
    invoke-direct/range {v0 .. v6}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;I)V

    .line 224
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v1

    check-cast v1, Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/DividerItemDecoration;->setProvider(Lme/grishka/appkit/views/DividerItemDecoration$Provider;)Lme/grishka/appkit/views/DividerItemDecoration;

    move-result-object v0

    .line 222
    invoke-virtual {v7, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 226
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setDrawSelectorOnTop(Z)V

    .line 227
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;

    move-result-object v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelectorBoundsProvider(Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;)V

    .line 253
    return-void

    .line 222
    :cond_0
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const/4 v4, -0x1

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_0

    :cond_1
    const/high16 v4, 0x41100000    # 9.0f

    .line 223
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    goto :goto_1
.end method
