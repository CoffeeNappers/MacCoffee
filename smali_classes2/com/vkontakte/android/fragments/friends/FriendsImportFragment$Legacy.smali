.class Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;
.super Ljava/lang/Object;
.source "FriendsImportFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Legacy"
.end annotation


# static fields
.field private static final FACEBOOK_RESULT:I = 0x65

.field public static final GMAIL_ERROR_RESULT:I = 0x67

.field public static final GPLUS_ERROR_RESULT:I = 0x66


# instance fields
.field fbCallbackMgr:Lcom/facebook/CallbackManager;

.field private fbReqCode:I

.field gmailAccount:Landroid/accounts/Account;

.field private importedContacts:Z

.field progress:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)V
    .locals 1

    .prologue
    .line 386
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 393
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importedContacts:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;

    .prologue
    .line 386
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)V

    return-void
.end method

.method static synthetic access$1302(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;
    .param p1, "x1"    # I

    .prologue
    .line 386
    iput p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->fbReqCode:I

    return p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    .prologue
    .line 386
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importedContacts:Z

    return v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;
    .param p1, "x1"    # Z

    .prologue
    .line 386
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importedContacts:Z

    return p1
.end method


# virtual methods
.method doImport(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p2, "myId"    # Ljava/lang/String;
    .param p3, "service"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 576
    .local p1, "usrs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 577
    .local v0, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 578
    .local v1, "u":Lcom/vkontakte/android/UserProfile;
    iget-object v3, v1, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "external_id"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 580
    .end local v1    # "u":Lcom/vkontakte/android/UserProfile;
    :cond_0
    new-instance v2, Lcom/vkontakte/android/api/account/AccountLookupContacts;

    invoke-direct {v2, v0, p3, p2}, Lcom/vkontakte/android/api/account/AccountLookupContacts;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$1;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-direct {v3, p0, v4, p1, p3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$1;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;Landroid/app/Fragment;Ljava/util/List;Ljava/lang/String;)V

    .line 581
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/account/AccountLookupContacts;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .line 664
    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 680
    return-void
.end method

.method importContacts()V
    .locals 2

    .prologue
    .line 452
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 453
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 572
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 573
    return-void
.end method

.method importFacebook(Lcom/facebook/AccessToken;)V
    .locals 1
    .param p1, "session"    # Lcom/facebook/AccessToken;

    .prologue
    .line 921
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 922
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;Lcom/facebook/AccessToken;)Lcom/facebook/GraphRequest$GraphJSONArrayCallback;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/facebook/GraphRequest;->newMyFriendsRequest(Lcom/facebook/AccessToken;Lcom/facebook/GraphRequest$GraphJSONArrayCallback;)Lcom/facebook/GraphRequest;

    move-result-object v0

    .line 960
    invoke-virtual {v0}, Lcom/facebook/GraphRequest;->executeAsync()Lcom/facebook/GraphRequestAsyncTask;

    .line 961
    return-void
.end method

.method importGmail(Landroid/accounts/Account;)V
    .locals 2
    .param p1, "acc"    # Landroid/accounts/Account;

    .prologue
    .line 790
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->gmailAccount:Landroid/accounts/Account;

    .line 791
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$2;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$2;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;Landroid/accounts/Account;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 866
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 867
    return-void
.end method

.method importGoogle()V
    .locals 0

    .prologue
    .line 755
    return-void
.end method

.method synthetic lambda$importContacts$4()V
    .locals 22

    .prologue
    .line 454
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 455
    .local v16, "numbers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 456
    .local v2, "resolver":Landroid/content/ContentResolver;
    const/4 v9, 0x0

    .line 457
    .local v9, "cursor":Landroid/database/Cursor;
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .local v15, "needRawContacts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 458
    .local v14, "needContacts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    new-instance v19, Ljava/util/HashMap;

    invoke-direct/range {v19 .. v19}, Ljava/util/HashMap;-><init>()V

    .line 459
    .local v19, "rawToContacts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 460
    .local v13, "names":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/String;>;"
    new-instance v18, Ljava/util/HashMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/HashMap;-><init>()V

    .line 463
    .local v18, "photos":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/String;>;"
    :try_start_0
    sget-object v3, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "data1"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "raw_contact_id"

    aput-object v6, v4, v5

    const-string/jumbo v5, "mimetype=\'vnd.android.cursor.item/phone_v2\' AND data2=2"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 464
    if-eqz v9, :cond_0

    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-nez v3, :cond_6

    .line 465
    :cond_0
    const-string/jumbo v3, "vk"

    const-string/jumbo v4, "cursor2.getCount = 0"

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 482
    :goto_0
    if-eqz v9, :cond_1

    .line 483
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 486
    :cond_1
    const/4 v9, 0x0

    .line 488
    :try_start_1
    sget-object v3, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "contact_id"

    aput-object v6, v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "_id IN ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ","

    invoke-static {v6, v15}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ") AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "account_type"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "<>\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "com.vkontakte.account"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 489
    if-eqz v9, :cond_2

    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-nez v3, :cond_8

    .line 490
    :cond_2
    const-string/jumbo v3, "vk"

    const-string/jumbo v4, "cursor2.getCount = 0"

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 502
    :goto_1
    if-eqz v9, :cond_3

    .line 503
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 506
    :cond_3
    const/4 v9, 0x0

    .line 508
    :try_start_2
    sget-object v3, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-ge v4, v5, :cond_a

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "display_name"

    aput-object v6, v4, v5

    :goto_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "_id IN ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ","

    invoke-static {v6, v14}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 509
    if-eqz v9, :cond_4

    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-nez v3, :cond_b

    .line 510
    :cond_4
    const-string/jumbo v3, "vk"

    const-string/jumbo v4, "cursor2.getCount = 0"

    invoke-static {v3, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 524
    :goto_3
    if-eqz v9, :cond_5

    .line 525
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 528
    :cond_5
    const/4 v10, 0x0

    .line 529
    .local v10, "i":I
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 530
    .local v11, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/vkontakte/android/UserProfile;

    .line 531
    .local v17, "p":Lcom/vkontakte/android/UserProfile;
    invoke-virtual {v15, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    .line 533
    .local v8, "contactId":Ljava/lang/Long;
    invoke-virtual {v13, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, v17

    iput-object v3, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 534
    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    :goto_5
    move-object/from16 v0, v17

    iput-object v3, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 536
    add-int/lit8 v10, v10, 0x1

    .line 537
    goto :goto_4

    .line 467
    .end local v8    # "contactId":Ljava/lang/Long;
    .end local v10    # "i":I
    .end local v11    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/UserProfile;>;"
    .end local v17    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_6
    :try_start_3
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 469
    :cond_7
    const-string/jumbo v3, "data1"

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 470
    .local v12, "n":Ljava/lang/String;
    new-instance v20, Lcom/vkontakte/android/UserProfile;

    invoke-direct/range {v20 .. v20}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 471
    .local v20, "u":Lcom/vkontakte/android/UserProfile;
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    move-object/from16 v0, v20

    iput-object v3, v0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 472
    move-object/from16 v0, v20

    iget-object v3, v0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "external_id"

    invoke-virtual {v3, v4, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    const/4 v3, 0x1

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 474
    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 476
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result v3

    if-nez v3, :cond_7

    goto/16 :goto_0

    .line 479
    .end local v12    # "n":Ljava/lang/String;
    .end local v20    # "u":Lcom/vkontakte/android/UserProfile;
    :catch_0
    move-exception v21

    .line 480
    .local v21, "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    move-object/from16 v0, v21

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 492
    .end local v21    # "x":Ljava/lang/Exception;
    :cond_8
    :try_start_4
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 494
    :cond_9
    const/4 v3, 0x0

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v9, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    const/4 v3, 0x1

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 496
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    move-result v3

    if-nez v3, :cond_9

    goto/16 :goto_1

    .line 499
    :catch_1
    move-exception v21

    .line 500
    .restart local v21    # "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    move-object/from16 v0, v21

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 508
    .end local v21    # "x":Ljava/lang/Exception;
    :cond_a
    const/4 v4, 0x3

    :try_start_5
    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "display_name"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string/jumbo v6, "photo_thumb_uri"

    aput-object v6, v4, v5
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto/16 :goto_2

    .line 521
    :catch_2
    move-exception v21

    .line 522
    .restart local v21    # "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    move-object/from16 v0, v21

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 512
    .end local v21    # "x":Ljava/lang/Exception;
    :cond_b
    :try_start_6
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 514
    :cond_c
    const/4 v3, 0x0

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v9, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    invoke-interface {v9}, Landroid/database/Cursor;->getColumnCount()I

    move-result v3

    const/4 v4, 0x2

    if-le v3, v4, :cond_d

    const/4 v3, 0x2

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_d

    .line 516
    const/4 v3, 0x0

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x2

    invoke-interface {v9, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    :cond_d
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    move-result v3

    if-nez v3, :cond_c

    goto/16 :goto_3

    .line 534
    .restart local v8    # "contactId":Ljava/lang/Long;
    .restart local v10    # "i":I
    .restart local v11    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/UserProfile;>;"
    .restart local v17    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_e
    const/4 v3, 0x0

    goto/16 :goto_5

    .line 557
    .end local v8    # "contactId":Ljava/lang/Long;
    .end local v17    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_f
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_11

    .line 558
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    if-eqz v3, :cond_10

    .line 559
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    invoke-static {v3}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 560
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 572
    :cond_10
    :goto_6
    return-void

    .line 571
    :cond_11
    const/4 v3, 0x0

    const-string/jumbo v4, "phone"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v3, v4}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->doImport(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6
.end method

.method synthetic lambda$importFacebook$7(Lcom/facebook/AccessToken;Lorg/json/JSONArray;Lcom/facebook/GraphResponse;)V
    .locals 9
    .param p1, "session"    # Lcom/facebook/AccessToken;
    .param p2, "users"    # Lorg/json/JSONArray;
    .param p3, "response"    # Lcom/facebook/GraphResponse;

    .prologue
    .line 923
    invoke-virtual {p3}, Lcom/facebook/GraphResponse;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 924
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 925
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 926
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    invoke-static {v6}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 927
    const v6, 0x7f0801f9

    const/4 v7, 0x0

    invoke-static {v0, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 960
    .end local v0    # "activity":Landroid/app/Activity;
    :cond_0
    :goto_0
    return-void

    .line 931
    :cond_1
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-nez v6, :cond_2

    .line 932
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 933
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    invoke-static {v6}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 934
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)Ljava/lang/Runnable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 945
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 947
    .local v1, "friends":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    :try_start_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v2, v6, :cond_3

    .line 948
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 949
    .local v5, "user":Lorg/json/JSONObject;
    new-instance v3, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v3}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 950
    .local v3, "p":Lcom/vkontakte/android/UserProfile;
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    iput-object v6, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 951
    iget-object v6, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "external_id"

    const-string/jumbo v8, "id"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 952
    const-string/jumbo v6, "name"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 953
    const/high16 v6, 0x42700000    # 60.0f

    invoke-static {v6}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    .line 954
    .local v4, "photoSize":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "https://graph.facebook.com/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v8, "external_id"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/picture?width="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "&height="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 955
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 947
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 957
    .end local v3    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v4    # "photoSize":I
    .end local v5    # "user":Lorg/json/JSONObject;
    :catch_0
    move-exception v6

    .line 959
    :cond_3
    invoke-virtual {p1}, Lcom/facebook/AccessToken;->getUserId()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "facebook"

    invoke-virtual {p0, v1, v6, v7}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->doImport(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method synthetic lambda$null$3()V
    .locals 3

    .prologue
    .line 561
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    .line 562
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080439

    .line 563
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 564
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 565
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 566
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->updateItems()V

    .line 567
    return-void
.end method

.method synthetic lambda$null$6()V
    .locals 3

    .prologue
    .line 935
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    .line 936
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08043c

    .line 937
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 938
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 939
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 940
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->updateItems()V

    .line 941
    return-void
.end method

.method synthetic lambda$startImportContacts$0(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v3, 0x1

    .line 439
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 445
    :goto_0
    return-void

    .line 442
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "agreed_import_contacts"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 443
    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importedContacts:Z

    .line 444
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importContacts()V

    goto :goto_0
.end method

.method synthetic lambda$startImportContacts$1(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 446
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->updateItems()V

    return-void
.end method

.method synthetic lambda$startImportContacts$2(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 447
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->updateItems()V

    return-void
.end method

.method synthetic lambda$startImportGmail$5([Landroid/accounts/Account;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "accs"    # [Landroid/accounts/Account;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 782
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 783
    aget-object v0, p1, p3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importGmail(Landroid/accounts/Account;)V

    .line 784
    return-void
.end method

.method onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v1, -0x1

    .line 416
    const/16 v0, 0x66

    if-ne p1, v0, :cond_1

    if-ne p2, v1, :cond_1

    .line 427
    :cond_0
    :goto_0
    return-void

    .line 418
    :cond_1
    const/16 v0, 0x67

    if-ne p1, v0, :cond_3

    .line 419
    if-ne p2, v1, :cond_2

    .line 420
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->gmailAccount:Landroid/accounts/Account;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importGmail(Landroid/accounts/Account;)V

    goto :goto_0

    .line 422
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    goto :goto_0

    .line 424
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    if-eqz v0, :cond_0

    .line 425
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    invoke-interface {v0, p1, p2, p3}, Lcom/facebook/CallbackManager;->onActivityResult(IILandroid/content/Intent;)Z

    goto :goto_0
.end method

.method onCreated()V
    .locals 3

    .prologue
    .line 397
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    .line 398
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 399
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08033d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 400
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "from_signup"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importedContacts:Z

    if-nez v0, :cond_0

    .line 401
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->startImportContacts()V

    .line 403
    :cond_0
    return-void
.end method

.method openNearby()V
    .locals 3

    .prologue
    .line 411
    new-instance v0, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;-><init>()V

    .line 412
    .local v0, "fragment":Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string/jumbo v2, "nearby_dlg"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 413
    return-void
.end method

.method openSearch()V
    .locals 3

    .prologue
    .line 406
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 407
    .local v0, "args":Landroid/os/Bundle;
    const-class v1, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 408
    return-void
.end method

.method startImportContacts()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 430
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "agreed_import_contacts"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "from_signup"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 431
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importedContacts:Z

    .line 432
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importContacts()V

    .line 449
    :goto_0
    return-void

    .line 435
    :cond_0
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 436
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0806e0

    .line 437
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 438
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 446
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v1

    .line 447
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 448
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method startImportFacebook()V
    .locals 5

    .prologue
    .line 870
    invoke-static {}, Lcom/facebook/FacebookSdk;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 871
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/FacebookSdk;->sdkInitialize(Landroid/content/Context;)V

    .line 873
    :cond_0
    invoke-static {}, Lcom/facebook/login/LoginManager;->getInstance()Lcom/facebook/login/LoginManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/login/LoginManager;->logOut()V

    .line 874
    invoke-static {}, Lcom/facebook/CallbackManager$Factory;->create()Lcom/facebook/CallbackManager;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    .line 875
    invoke-static {}, Lcom/facebook/login/LoginManager;->getInstance()Lcom/facebook/login/LoginManager;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->fbCallbackMgr:Lcom/facebook/CallbackManager;

    new-instance v3, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$3;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$3;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)V

    invoke-virtual {v1, v2, v3}, Lcom/facebook/login/LoginManager;->registerCallback(Lcom/facebook/CallbackManager;Lcom/facebook/FacebookCallback;)V

    .line 896
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$4;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$4;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)V

    .line 917
    .local v0, "act":Landroid/app/Activity;
    invoke-static {}, Lcom/facebook/login/LoginManager;->getInstance()Lcom/facebook/login/LoginManager;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "email"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string/jumbo v4, "user_birthday"

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/facebook/login/LoginManager;->logInWithReadPermissions(Landroid/app/Activity;Ljava/util/Collection;)V

    .line 918
    return-void
.end method

.method startImportGmail()V
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 758
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v3

    const-string/jumbo v5, "com.google"

    invoke-virtual {v3, v5}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 759
    .local v1, "accs":[Landroid/accounts/Account;
    array-length v3, v1

    if-nez v3, :cond_0

    .line 760
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f0801f9

    .line 761
    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f080442

    .line 762
    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f080479

    const/4 v5, 0x0

    .line 763
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 764
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 787
    :goto_0
    return-void

    .line 767
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v3

    if-eqz v3, :cond_1

    .line 768
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v5, "android.intent.action.VIEW"

    const-string/jumbo v6, "https://play.google.com/store/apps/details?id=com.google.android.gms"

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 771
    :cond_1
    array-length v3, v1

    const/4 v5, 0x1

    if-ne v3, v5, :cond_2

    .line 772
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->show()V

    .line 773
    aget-object v3, v1, v4

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->importGmail(Landroid/accounts/Account;)V

    goto :goto_0

    .line 775
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 776
    .local v2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    array-length v5, v1

    move v3, v4

    :goto_1
    if-ge v3, v5, :cond_3

    aget-object v0, v1, v3

    .line 777
    .local v0, "acc":Landroid/accounts/Account;
    iget-object v6, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 776
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 779
    .end local v0    # "acc":Landroid/accounts/Account;
    :cond_3
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v3, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f080317

    .line 780
    invoke-virtual {v3, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    new-array v3, v4, [Ljava/lang/String;

    .line 781
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/CharSequence;

    invoke-static {p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;[Landroid/accounts/Account;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v4

    invoke-virtual {v5, v3, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 785
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method startImportGoogle()V
    .locals 0

    .prologue
    .line 713
    return-void
.end method
