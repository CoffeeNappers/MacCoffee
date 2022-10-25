.class public Lcom/vkontakte/android/data/Friends;
.super Ljava/lang/Object;
.source "Friends.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/data/Friends$Request;,
        Lcom/vkontakte/android/data/Friends$GetImportedContactsCallback;,
        Lcom/vkontakte/android/data/Friends$GetUsersCallback;,
        Lcom/vkontakte/android/data/Friends$Section;,
        Lcom/vkontakte/android/data/Friends$Folder;
    }
.end annotation


# static fields
.field public static final ACTION_FRIEND_COUNTER_CHANGED:Ljava/lang/String; = "com.vkontakte.android.FRIEND_COUNTER_CHANGED"

.field public static final ACTION_FRIEND_LIST_CHANGED:Ljava/lang/String; = "com.vkontakte.android.FRIEND_LIST_CHANGED"

.field public static final ACTION_FRIEND_REQUESTS_CHANGED:Ljava/lang/String; = "com.vkontakte.android.FRIEND_REQUESTS_CHANGED"

.field public static final ACTION_FRIEND_STATUS_CHANGED:Ljava/lang/String; = "com.vkontakte.android.ACTION_FRIEND_STATUS_CHANGED"

.field public static final CASE_ABL:I = 0x5

.field public static final CASE_ABL_FIRST:I = 0xf

.field public static final CASE_ACC:I = 0x3

.field public static final CASE_ACC_FIRST:I = 0xd

.field public static final CASE_DAT:I = 0x2

.field public static final CASE_DAT_FIRST:I = 0xc

.field public static final CASE_GEN:I = 0x1

.field public static final CASE_GEN_FIRST:I = 0xb

.field public static final CASE_INS:I = 0x4

.field public static final CASE_INS_FIRST:I = 0xe

.field public static final CASE_NOM:I = 0x0

.field public static final CASE_NOM_FIRST:I = 0xa

.field private static final DEBUG:Z = false

.field public static final IMPORT_SERVICE_CONTACTS:I = 0x0

.field public static final IMPORT_SERVICE_FACEBOOK:I = 0x2

.field public static final IMPORT_SERVICE_GOOGLE:I = 0x1

.field public static final IMPORT_SERVICE_MAIL:I = 0x3

.field private static final SORT_FIRST:I = 0x1

.field private static final SORT_HINTS:I = 0x0

.field private static final SORT_LAST:I = 0x2

.field private static friends:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private static hints:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static index:Lcom/vkontakte/android/SearchIndexer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/SearchIndexer",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private static lists:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/Friends$Folder;",
            ">;"
        }
    .end annotation
.end field

.field private static loadedOnlines:Z

.field private static loading:Z

.field private static sections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/Friends$Section;",
            ">;"
        }
    .end annotation
.end field

.field private static semaphore:Ljava/util/concurrent/Semaphore;

.field private static sorting:Z

.field private static users:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 35
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getFriends()Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Friends;->hints:Ljava/util/ArrayList;

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Friends;->lists:Ljava/util/ArrayList;

    .line 88
    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/data/Friends;->users:Landroid/util/LruCache;

    .line 89
    new-instance v0, Lcom/vkontakte/android/SearchIndexer;

    invoke-direct {v0}, Lcom/vkontakte/android/SearchIndexer;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Friends;->index:Lcom/vkontakte/android/SearchIndexer;

    .line 90
    sput-boolean v2, Lcom/vkontakte/android/data/Friends;->loadedOnlines:Z

    .line 91
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v3, v3}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    sput-object v0, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    .line 92
    sput-boolean v2, Lcom/vkontakte/android/data/Friends;->loading:Z

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Friends;->sections:Ljava/util/ArrayList;

    .line 94
    sput-boolean v2, Lcom/vkontakte/android/data/Friends;->sorting:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/vkontakte/android/data/Friends;->lists:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$002(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Ljava/util/ArrayList;

    .prologue
    .line 32
    sput-object p0, Lcom/vkontakte/android/data/Friends;->lists:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$102(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 32
    sput-boolean p0, Lcom/vkontakte/android/data/Friends;->loading:Z

    return p0
.end method

.method static synthetic access$200()Ljava/util/concurrent/Semaphore;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$300()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$302(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Ljava/util/ArrayList;

    .prologue
    .line 32
    sput-object p0, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$400()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/vkontakte/android/data/Friends;->hints:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500()Lcom/vkontakte/android/SearchIndexer;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/vkontakte/android/data/Friends;->index:Lcom/vkontakte/android/SearchIndexer;

    return-object v0
.end method

.method static synthetic access$600()V
    .locals 0

    .prologue
    .line 32
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->updateIndex()V

    return-void
.end method

.method static synthetic access$702(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 32
    sput-boolean p0, Lcom/vkontakte/android/data/Friends;->loadedOnlines:Z

    return p0
.end method

.method static synthetic access$800()Landroid/util/LruCache;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/vkontakte/android/data/Friends;->users:Landroid/util/LruCache;

    return-object v0
.end method

.method public static addLocally(Lcom/vkontakte/android/UserProfile;)V
    .locals 4
    .param p0, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 275
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 278
    :goto_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 279
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 280
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 281
    .local v0, "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 282
    sget-object v1, Lcom/vkontakte/android/data/Friends;->hints:Ljava/util/ArrayList;

    sget-object v2, Lcom/vkontakte/android/data/Friends;->hints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget v3, p0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 283
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/cache/Cache;->updateFriends(Ljava/util/List;Z)V

    .line 284
    sget-object v1, Lcom/vkontakte/android/data/Friends;->index:Lcom/vkontakte/android/SearchIndexer;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/SearchIndexer;->add(Lcom/vkontakte/android/Indexable;)V

    .line 285
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 286
    return-void

    .line 276
    .end local v0    # "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static createSections(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/Friends$Section;",
            ">;"
        }
    .end annotation

    .prologue
    .line 581
    .local p0, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    sget-object v12, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v12}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v12

    const-string/jumbo v13, "friendsOrderNew"

    const-string/jumbo v14, "firstname"

    invoke-interface {v12, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 582
    .local v6, "pref":Ljava/lang/String;
    const/4 v9, 0x0

    .line 583
    .local v9, "sortPref":I
    const-string/jumbo v12, "hints"

    invoke-virtual {v12, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 584
    const/4 v9, 0x0

    .line 590
    :cond_0
    :goto_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 591
    .local v7, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/Friends$Section;>;"
    if-eqz v9, :cond_c

    .line 592
    const-string/jumbo v12, "vk"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " Create sections thread start, users size="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    const/4 v12, 0x1

    if-ne v9, v12, :cond_3

    const/4 v3, 0x1

    .line 594
    .local v3, "firstName":Z
    :goto_1
    const/4 v0, 0x0

    .line 603
    .local v0, "curSection":Lcom/vkontakte/android/data/Friends$Section;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/UserProfile;

    .line 604
    .local v5, "p":Lcom/vkontakte/android/UserProfile;
    if-eqz v3, :cond_4

    .line 605
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v5, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v5, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v5, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    goto :goto_2

    .line 585
    .end local v0    # "curSection":Lcom/vkontakte/android/data/Friends$Section;
    .end local v3    # "firstName":Z
    .end local v5    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v7    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/Friends$Section;>;"
    :cond_1
    const-string/jumbo v12, "firstname"

    invoke-virtual {v12, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 586
    const/4 v9, 0x1

    goto :goto_0

    .line 587
    :cond_2
    const-string/jumbo v12, "lastname"

    invoke-virtual {v12, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 588
    const/4 v9, 0x2

    goto :goto_0

    .line 593
    .restart local v7    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/Friends$Section;>;"
    :cond_3
    const/4 v3, 0x0

    goto :goto_1

    .line 607
    .restart local v0    # "curSection":Lcom/vkontakte/android/data/Friends$Section;
    .restart local v3    # "firstName":Z
    .restart local v5    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_4
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v5, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v5, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v5, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    goto :goto_2

    .line 610
    .end local v5    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_5
    new-instance v12, Lcom/vkontakte/android/data/Friends$5;

    invoke-direct {v12}, Lcom/vkontakte/android/data/Friends$5;-><init>()V

    invoke-static {p0, v12}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 619
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/UserProfile;

    .line 620
    .restart local v5    # "p":Lcom/vkontakte/android/UserProfile;
    const/4 v13, 0x0

    iput-object v13, v5, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    goto :goto_3

    .line 622
    .end local v5    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_6
    const/4 v2, 0x0

    .line 623
    .local v2, "fc":C
    const/4 v4, 0x0

    .line 624
    .local v4, "offset":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_b

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/UserProfile;

    .line 626
    .local v10, "user":Lcom/vkontakte/android/UserProfile;
    if-eqz v3, :cond_8

    :try_start_0
    iget-object v12, v10, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    :goto_5
    const/4 v14, 0x0

    invoke-virtual {v12, v14}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-eq v12, v2, :cond_7

    .line 627
    if-eqz v3, :cond_9

    iget-object v12, v10, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    :goto_6
    const/4 v14, 0x0

    invoke-virtual {v12, v14}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 628
    if-eqz v0, :cond_a

    iget-object v12, v0, Lcom/vkontakte/android/data/Friends$Section;->list:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, 0x1

    :goto_7
    add-int/2addr v4, v12

    .line 629
    new-instance v1, Lcom/vkontakte/android/data/Friends$Section;

    invoke-direct {v1}, Lcom/vkontakte/android/data/Friends$Section;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 630
    .end local v0    # "curSection":Lcom/vkontakte/android/data/Friends$Section;
    .local v1, "curSection":Lcom/vkontakte/android/data/Friends$Section;
    :try_start_1
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v14, ""

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v1, Lcom/vkontakte/android/data/Friends$Section;->title:Ljava/lang/String;

    .line 631
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    iput-object v12, v1, Lcom/vkontakte/android/data/Friends$Section;->list:Ljava/util/List;

    .line 633
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v0, v1

    .line 635
    .end local v1    # "curSection":Lcom/vkontakte/android/data/Friends$Section;
    .restart local v0    # "curSection":Lcom/vkontakte/android/data/Friends$Section;
    :cond_7
    :try_start_2
    iget-object v12, v0, Lcom/vkontakte/android/data/Friends$Section;->list:Ljava/util/List;

    invoke-interface {v12, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_4

    .line 636
    :catch_0
    move-exception v11

    .line 637
    .local v11, "x":Ljava/lang/Exception;
    :goto_8
    const-string/jumbo v12, "vk"

    invoke-static {v12, v11}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4

    .line 626
    .end local v11    # "x":Ljava/lang/Exception;
    :cond_8
    :try_start_3
    iget-object v12, v10, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    goto :goto_5

    .line 627
    :cond_9
    iget-object v12, v10, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_6

    .line 628
    :cond_a
    const/4 v12, 0x0

    goto :goto_7

    .line 640
    .end local v10    # "user":Lcom/vkontakte/android/UserProfile;
    :cond_b
    const-string/jumbo v12, "vk"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " Create sections done, "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 646
    .end local v0    # "curSection":Lcom/vkontakte/android/data/Friends$Section;
    .end local v2    # "fc":C
    .end local v3    # "firstName":Z
    .end local v4    # "offset":I
    :goto_9
    return-object v7

    .line 642
    :cond_c
    new-instance v8, Lcom/vkontakte/android/data/Friends$Section;

    invoke-direct {v8}, Lcom/vkontakte/android/data/Friends$Section;-><init>()V

    .line 643
    .local v8, "s":Lcom/vkontakte/android/data/Friends$Section;
    iput-object p0, v8, Lcom/vkontakte/android/data/Friends$Section;->list:Ljava/util/List;

    .line 644
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 636
    .end local v8    # "s":Lcom/vkontakte/android/data/Friends$Section;
    .restart local v1    # "curSection":Lcom/vkontakte/android/data/Friends$Section;
    .restart local v2    # "fc":C
    .restart local v3    # "firstName":Z
    .restart local v4    # "offset":I
    .restart local v10    # "user":Lcom/vkontakte/android/UserProfile;
    :catch_1
    move-exception v11

    move-object v0, v1

    .end local v1    # "curSection":Lcom/vkontakte/android/data/Friends$Section;
    .restart local v0    # "curSection":Lcom/vkontakte/android/data/Friends$Section;
    goto :goto_8
.end method

.method public static decreaseRequests()V
    .locals 3

    .prologue
    .line 701
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.FRIEND_REQUESTS_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 702
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumFriendRequests()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1}, Lcom/vkontakte/android/LongPollService;->setNumFriendRequests(I)V

    .line 703
    const-string/jumbo v1, "value"

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumFriendRequests()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 704
    const-string/jumbo v1, "decrease"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 705
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 706
    return-void
.end method

.method public static get(I)Lcom/vkontakte/android/UserProfile;
    .locals 3
    .param p0, "uid"    # I

    .prologue
    .line 229
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    :goto_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 233
    .local v0, "user":Lcom/vkontakte/android/UserProfile;
    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v2, p0, :cond_0

    .line 234
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 239
    .end local v0    # "user":Lcom/vkontakte/android/UserProfile;
    :goto_1
    return-object v0

    .line 238
    :cond_1
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 239
    const/4 v0, 0x0

    goto :goto_1

    .line 230
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static getFriends(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 196
    .local p0, "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    sget-boolean v0, Lcom/vkontakte/android/data/Friends;->loadedOnlines:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 197
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->reload(Z)V

    .line 199
    :cond_0
    sget-object v0, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 200
    return-void
.end method

.method public static getFriends(Ljava/util/ArrayList;I)V
    .locals 2
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 203
    .local p0, "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    sget-boolean v1, Lcom/vkontakte/android/data/Friends;->loadedOnlines:Z

    if-nez v1, :cond_0

    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 204
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/vkontakte/android/data/Friends;->reload(Z)V

    .line 206
    :cond_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 207
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_1

    .line 208
    sget-object v1, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 207
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 210
    :cond_1
    return-void
.end method

.method public static getFromAll(I)Lcom/vkontakte/android/UserProfile;
    .locals 8
    .param p0, "uid"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 244
    :try_start_0
    sget-object v4, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 247
    :goto_0
    sget-object v4, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    .line 248
    .local v3, "user":Lcom/vkontakte/android/UserProfile;
    iget v5, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v5, p0, :cond_0

    .line 249
    sget-object v4, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    move-object v1, v3

    .line 270
    .end local v3    # "user":Lcom/vkontakte/android/UserProfile;
    :cond_1
    :goto_1
    return-object v1

    .line 253
    :cond_2
    sget-object v4, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    .line 254
    sget-object v4, Lcom/vkontakte/android/data/Friends;->users:Landroid/util/LruCache;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 255
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    if-nez v1, :cond_1

    .line 258
    new-array v4, v7, [Ljava/lang/Integer;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4, v6}, Lcom/vkontakte/android/cache/Cache;->getUsers(Ljava/util/List;Z)Ljava/util/ArrayList;

    move-result-object v0

    .line 259
    .local v0, "fromCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_3

    .line 260
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 261
    .restart local v1    # "p":Lcom/vkontakte/android/UserProfile;
    sget-object v4, Lcom/vkontakte/android/data/Friends;->users:Landroid/util/LruCache;

    iget v5, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 264
    :cond_3
    new-array v4, v7, [Ljava/lang/Integer;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4, v7}, Lcom/vkontakte/android/cache/Cache;->getUsers(Ljava/util/List;Z)Ljava/util/ArrayList;

    move-result-object v2

    .line 265
    .local v2, "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_4

    .line 266
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 267
    .restart local v1    # "p":Lcom/vkontakte/android/UserProfile;
    sget-object v4, Lcom/vkontakte/android/data/Friends;->users:Landroid/util/LruCache;

    iget v5, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 270
    :cond_4
    const/4 v1, 0x0

    goto :goto_1

    .line 245
    .end local v0    # "fromCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v2    # "pp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :catch_0
    move-exception v4

    goto/16 :goto_0
.end method

.method private static getGroup(I)Lcom/vkontakte/android/UserProfile;
    .locals 3
    .param p0, "gid"    # I

    .prologue
    .line 352
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result v2

    invoke-static {v2}, Lcom/vkontakte/android/data/Groups;->getById(I)Lcom/vkontakte/android/api/Group;

    move-result-object v0

    .line 353
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    if-nez v0, :cond_0

    .line 354
    const/4 v1, 0x0

    .line 360
    :goto_0
    return-object v1

    .line 356
    :cond_0
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v1}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 357
    .local v1, "user":Lcom/vkontakte/android/UserProfile;
    iget v2, v0, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v2, v2

    iput v2, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 358
    iget-object v2, v0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    iput-object v2, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 359
    iget-object v2, v0, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    iput-object v2, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    goto :goto_0
.end method

.method public static getImportedContacts(ILcom/vkontakte/android/data/Friends$GetImportedContactsCallback;)V
    .locals 2
    .param p0, "service"    # I
    .param p1, "callback"    # Lcom/vkontakte/android/data/Friends$GetImportedContactsCallback;

    .prologue
    .line 493
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/vkontakte/android/data/Friends$4;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/data/Friends$4;-><init>(ILcom/vkontakte/android/data/Friends$GetImportedContactsCallback;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 519
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 520
    return-void
.end method

.method public static getListById(I)Lcom/vkontakte/android/data/Friends$Folder;
    .locals 3
    .param p0, "lid"    # I

    .prologue
    .line 549
    sget-object v1, Lcom/vkontakte/android/data/Friends;->lists:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/Friends$Folder;

    .line 550
    .local v0, "f":Lcom/vkontakte/android/data/Friends$Folder;
    iget v2, v0, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    if-ne v2, p0, :cond_0

    .line 554
    .end local v0    # "f":Lcom/vkontakte/android/data/Friends$Folder;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getLists(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/Friends$Folder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 545
    .local p0, "out":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/Friends$Folder;>;"
    sget-object v0, Lcom/vkontakte/android/data/Friends;->lists:Ljava/util/ArrayList;

    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 546
    return-void
.end method

.method public static getOnlineStatus(I)I
    .locals 3
    .param p0, "uid"    # I

    .prologue
    .line 214
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 217
    :goto_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 218
    .local v0, "user":Lcom/vkontakte/android/UserProfile;
    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v2, p0, :cond_0

    .line 219
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 220
    iget v1, v0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 224
    .end local v0    # "user":Lcom/vkontakte/android/UserProfile;
    :goto_1
    return v1

    .line 223
    :cond_1
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 224
    const/4 v1, 0x0

    goto :goto_1

    .line 215
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static getSortedFriends(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/Friends$Section;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 650
    .local p0, "out":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/Friends$Section;>;"
    sget-object v2, Lcom/vkontakte/android/data/Friends;->sections:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/Friends$Section;

    .line 651
    .local v1, "section":Lcom/vkontakte/android/data/Friends$Section;
    new-instance v0, Lcom/vkontakte/android/data/Friends$Section;

    invoke-direct {v0}, Lcom/vkontakte/android/data/Friends$Section;-><init>()V

    .line 652
    .local v0, "s":Lcom/vkontakte/android/data/Friends$Section;
    iget-object v3, v1, Lcom/vkontakte/android/data/Friends$Section;->title:Ljava/lang/String;

    iput-object v3, v0, Lcom/vkontakte/android/data/Friends$Section;->title:Ljava/lang/String;

    .line 653
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lcom/vkontakte/android/data/Friends$Section;->list:Ljava/util/List;

    .line 654
    iget-object v3, v0, Lcom/vkontakte/android/data/Friends$Section;->list:Ljava/util/List;

    iget-object v4, v1, Lcom/vkontakte/android/data/Friends$Section;->list:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 655
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 657
    .end local v0    # "s":Lcom/vkontakte/android/data/Friends$Section;
    .end local v1    # "section":Lcom/vkontakte/android/data/Friends$Section;
    :cond_0
    return-void
.end method

.method public static getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V
    .locals 1
    .param p1, "callback"    # Lcom/vkontakte/android/data/Friends$GetUsersCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/vkontakte/android/data/Friends$GetUsersCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 364
    .local p0, "uids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;I)V

    .line 365
    return-void
.end method

.method public static getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;I)V
    .locals 7
    .param p1, "callback"    # Lcom/vkontakte/android/data/Friends$GetUsersCallback;
    .param p2, "nameCase"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/vkontakte/android/data/Friends$GetUsersCallback;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 368
    .local p0, "uids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Integer;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 369
    .local v0, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 370
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 374
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 375
    .local v2, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 376
    .local v3, "uid":I
    if-gtz v3, :cond_1

    const v4, -0x77359400

    if-ge v3, v4, :cond_2

    :cond_1
    sget-object v4, Lcom/vkontakte/android/data/Friends;->users:Landroid/util/LruCache;

    shl-int/lit8 v6, p2, 0x18

    or-int/2addr v6, v3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/UserProfile;

    move-object v1, v4

    .line 377
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    :goto_1
    if-eqz v1, :cond_0

    iget-object v4, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-static {v4}, Lcom/vkontakte/android/utils/Utils;->isBlank(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 378
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    iget v4, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 376
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_2
    invoke-static {v3}, Lcom/vkontakte/android/data/Friends;->getGroup(I)Lcom/vkontakte/android/UserProfile;

    move-result-object v1

    goto :goto_1

    .line 385
    .end local v3    # "uid":I
    :cond_3
    if-nez p2, :cond_6

    .line 386
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 387
    .restart local v3    # "uid":I
    if-ltz v3, :cond_4

    .line 390
    sget-object v4, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 391
    .restart local v1    # "p":Lcom/vkontakte/android/UserProfile;
    if-eqz v1, :cond_5

    iget v6, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v6, v3, :cond_5

    .line 392
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 393
    iget v4, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    .line 402
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v3    # "uid":I
    :cond_6
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_7

    .line 406
    invoke-interface {p1, v2}, Lcom/vkontakte/android/data/Friends$GetUsersCallback;->onUsersLoaded(Ljava/util/ArrayList;)V

    .line 458
    :goto_3
    return-void

    .line 409
    :cond_7
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/vkontakte/android/data/Friends$2;

    invoke-direct {v5, v0, p2, v2, p1}, Lcom/vkontakte/android/data/Friends$2;-><init>(Ljava/util/ArrayList;ILjava/util/ArrayList;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 457
    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    goto :goto_3
.end method

.method public static getUsersBlocking(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 461
    .local p0, "uids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getUsersBlocking(Ljava/util/List;I)Ljava/util/ArrayList;
    .locals 5
    .param p1, "nameCase"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .local p0, "uids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v4, 0x0

    .line 465
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 466
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_0

    .line 489
    :goto_0
    return-object v2

    .line 469
    :cond_0
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 470
    .local v1, "lock":Ljava/lang/Object;
    const/4 v3, 0x1

    new-array v0, v3, [Z

    aput-boolean v4, v0, v4

    .line 471
    .local v0, "done":[Z
    new-instance v3, Lcom/vkontakte/android/data/Friends$3;

    invoke-direct {v3, v2, v0, v1}, Lcom/vkontakte/android/data/Friends$3;-><init>(Ljava/util/ArrayList;[ZLjava/lang/Object;)V

    invoke-static {p0, v3, p1}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;I)V

    .line 481
    monitor-enter v1

    .line 482
    const/4 v3, 0x0

    :try_start_0
    aget-boolean v3, v0, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_1

    .line 484
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 488
    :cond_1
    :goto_1
    :try_start_2
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 485
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method public static intersect(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 335
    .local p0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .local p1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :try_start_0
    sget-object v2, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 338
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 339
    .local v1, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    sget-object v2, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 340
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    iget v3, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 342
    .end local v0    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    sget-object v2, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 344
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 345
    .restart local v0    # "p":Lcom/vkontakte/android/UserProfile;
    iget v3, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 346
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 349
    .end local v0    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_2
    return-void

    .line 336
    .end local v1    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static isFriend(I)Z
    .locals 3
    .param p0, "uid"    # I

    .prologue
    .line 185
    sget-object v1, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 186
    .local v0, "user":Lcom/vkontakte/android/UserProfile;
    if-eqz v0, :cond_0

    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v2, p0, :cond_0

    .line 188
    const/4 v1, 0x1

    .line 192
    .end local v0    # "user":Lcom/vkontakte/android/UserProfile;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static notifyCounterChanged(ILcom/vkontakte/android/data/Friends$Request;)V
    .locals 3
    .param p0, "counter"    # I
    .param p1, "type"    # Lcom/vkontakte/android/data/Friends$Request;

    .prologue
    .line 688
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.FRIEND_COUNTER_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 689
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "value"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 690
    const-string/jumbo v1, "type"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 691
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 692
    return-void
.end method

.method public static notifyFriendStatusChanged(II)V
    .locals 3
    .param p0, "id"    # I
    .param p1, "status"    # I

    .prologue
    .line 709
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.ACTION_FRIEND_STATUS_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "status"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 710
    return-void
.end method

.method public static notifyRequestsChanged(I)V
    .locals 3
    .param p0, "requests"    # I

    .prologue
    .line 695
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.FRIEND_REQUESTS_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 696
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "value"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 697
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 698
    return-void
.end method

.method public static reload(Z)V
    .locals 3
    .param p0, "forceNetwork"    # Z

    .prologue
    .line 98
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "RELOAD FRIENDS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    sget-boolean v0, Lcom/vkontakte/android/data/Friends;->loading:Z

    if-eqz v0, :cond_0

    .line 176
    :goto_0
    return-void

    .line 102
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/vkontakte/android/data/Friends$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/data/Friends$1;-><init>(Z)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 175
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public static removeLocally(I)V
    .locals 4
    .param p0, "uid"    # I

    .prologue
    .line 289
    invoke-static {p0}, Lcom/vkontakte/android/data/Friends;->get(I)Lcom/vkontakte/android/UserProfile;

    move-result-object v0

    .line 291
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 294
    :goto_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 295
    sget-object v1, Lcom/vkontakte/android/data/Friends;->hints:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 296
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 297
    invoke-static {p0}, Lcom/vkontakte/android/cache/Cache;->removeFriend(I)V

    .line 298
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->updateIndex()V

    .line 299
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 300
    return-void

    .line 292
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static reset()V
    .locals 1

    .prologue
    .line 530
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 533
    :goto_0
    sget-object v0, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 534
    sget-object v0, Lcom/vkontakte/android/data/Friends;->hints:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 535
    sget-object v0, Lcom/vkontakte/android/data/Friends;->lists:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 536
    sget-object v0, Lcom/vkontakte/android/data/Friends;->users:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    .line 537
    sget-object v0, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 538
    return-void

    .line 531
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static saveImportedContacts(ILjava/util/List;Ljava/util/List;)V
    .locals 2
    .param p0, "service"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    .local p2, "notOnVk":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v1, 0x0

    .line 523
    invoke-static {p1, v1}, Lcom/vkontakte/android/cache/Cache;->updatePeers(Ljava/util/List;Z)V

    .line 524
    const/4 v0, 0x1

    invoke-static {p1, p0, v0}, Lcom/vkontakte/android/cache/Cache;->saveImportedContacts(Ljava/util/List;IZ)V

    .line 525
    invoke-static {p2, p0, v1}, Lcom/vkontakte/android/cache/Cache;->saveImportedContacts(Ljava/util/List;IZ)V

    .line 526
    return-void
.end method

.method public static search(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0, "q"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 541
    sget-object v0, Lcom/vkontakte/android/data/Friends;->index:Lcom/vkontakte/android/SearchIndexer;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/SearchIndexer;->search(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static setOnlineStatus(II)V
    .locals 3
    .param p0, "uid"    # I
    .param p1, "status"    # I

    .prologue
    .line 321
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 324
    :goto_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 325
    .local v0, "user":Lcom/vkontakte/android/UserProfile;
    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v2, p0, :cond_0

    .line 326
    iput p1, v0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 330
    .end local v0    # "user":Lcom/vkontakte/android/UserProfile;
    :cond_1
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 331
    return-void

    .line 322
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static setOnlines(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 304
    .local p0, "onlines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .local p1, "mobileOnlines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 307
    :goto_0
    sget-object v1, Lcom/vkontakte/android/data/Friends;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 308
    .local v0, "user":Lcom/vkontakte/android/UserProfile;
    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 309
    const/4 v2, 0x1

    iput v2, v0, Lcom/vkontakte/android/UserProfile;->online:I

    goto :goto_1

    .line 310
    :cond_0
    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 311
    const/4 v2, 0x3

    iput v2, v0, Lcom/vkontakte/android/UserProfile;->online:I

    goto :goto_1

    .line 313
    :cond_1
    const/4 v2, 0x0

    iput v2, v0, Lcom/vkontakte/android/UserProfile;->online:I

    goto :goto_1

    .line 316
    .end local v0    # "user":Lcom/vkontakte/android/UserProfile;
    :cond_2
    sget-object v1, Lcom/vkontakte/android/data/Friends;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 317
    return-void

    .line 305
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static updateIndex()V
    .locals 3

    .prologue
    .line 179
    sget-object v0, Lcom/vkontakte/android/data/Friends;->index:Lcom/vkontakte/android/SearchIndexer;

    invoke-virtual {v0}, Lcom/vkontakte/android/SearchIndexer;->build()V

    .line 180
    sget-object v0, Lcom/vkontakte/android/data/Friends;->index:Lcom/vkontakte/android/SearchIndexer;

    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/auth/VKAccount;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/SearchIndexer;->add(Lcom/vkontakte/android/Indexable;)V

    .line 181
    return-void
.end method

.method public static updateSorting()V
    .locals 0

    .prologue
    .line 572
    return-void
.end method
