.class public final Lru/mail/libverify/accounts/c;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/accounts/b;


# instance fields
.field private final a:Landroid/content/Context;

.field private b:Ljava/lang/String;

.field private c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;"
        }
    .end annotation
.end field

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;"
        }
    .end annotation
.end field

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;"
        }
    .end annotation
.end field

.field private h:Lru/mail/libverify/accounts/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    return-void
.end method

.method private a(Landroid/content/Context;)Ljava/util/List;
    .locals 13
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;"
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lru/mail/libverify/accounts/c;->c:Ljava/util/List;

    if-nez v0, :cond_2

    invoke-static {p1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/accounts/c;->c:Ljava/util/List;

    invoke-static {}, Lru/mail/libverify/accounts/a$a;->values()[Lru/mail/libverify/accounts/a$a;

    move-result-object v4

    array-length v5, v4

    move v2, v1

    :goto_0
    if-ge v2, v5, :cond_2

    aget-object v6, v4, v2

    iget-object v0, v6, Lru/mail/libverify/accounts/a$a;->mPackageName:Ljava/lang/String;

    invoke-virtual {v3, v0}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v7

    array-length v8, v7

    move v0, v1

    :goto_1
    if-ge v0, v8, :cond_1

    aget-object v9, v7, v0

    iget-object v10, v9, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_0

    iget-object v10, p0, Lru/mail/libverify/accounts/c;->c:Ljava/util/List;

    new-instance v11, Lru/mail/libverify/accounts/a;

    iget-object v12, v6, Lru/mail/libverify/accounts/a$a;->mPackageName:Ljava/lang/String;

    iget-object v9, v9, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-direct {v11, v12, v9}, Lru/mail/libverify/accounts/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->c:Ljava/util/List;

    return-object v0
.end method

.method private static a(Lcom/google/i18n/phonenumbers/PhoneNumberUtil;Ljava/util/List;)Lru/mail/libverify/accounts/a;
    .locals 6
    .param p0    # Lcom/google/i18n/phonenumbers/PhoneNumberUtil;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/i18n/phonenumbers/PhoneNumberUtil;",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;)",
            "Lru/mail/libverify/accounts/a;"
        }
    .end annotation

    const/4 v1, 0x0

    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/accounts/a;

    iget-object v2, v0, Lru/mail/libverify/accounts/a;->b:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, v0, Lru/mail/libverify/accounts/a;->b:Ljava/lang/String;

    const-string/jumbo v4, "+"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "+"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    :cond_1
    const/4 v4, 0x0

    :try_start_1
    invoke-virtual {p0, v2, v4}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->parseAndKeepRawInput(Ljava/lang/String;Ljava/lang/String;)Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->isValidNumber(Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, v0, Lru/mail/libverify/accounts/a;->a:Ljava/lang/String;

    new-instance v0, Lru/mail/libverify/accounts/a;

    invoke-direct {v0, v4, v2}, Lru/mail/libverify/accounts/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/google/i18n/phonenumbers/NumberParseException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    return-object v0

    :catch_0
    move-exception v0

    const-string/jumbo v2, "PhoneAccountFinder"

    const-string/jumbo v3, "error during findBestMatchAccount"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    move-object v0, v1

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method private b(Landroid/content/Context;)Ljava/util/List;
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lru/mail/libverify/accounts/c;->f:Ljava/util/List;

    if-nez v0, :cond_1

    invoke-static {p1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lru/mail/libverify/accounts/c;->f:Ljava/util/List;

    invoke-virtual {v0}, Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v1

    array-length v2, v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, v1, v0

    iget-object v4, v3, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lru/mail/libverify/accounts/c;->f:Ljava/util/List;

    new-instance v5, Lru/mail/libverify/accounts/a;

    iget-object v6, v3, Landroid/accounts/Account;->type:Ljava/lang/String;

    iget-object v3, v3, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-direct {v5, v6, v3}, Lru/mail/libverify/accounts/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->f:Ljava/util/List;

    return-object v0
.end method

.method private c(Landroid/content/Context;)Ljava/util/List;
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;"
        }
    .end annotation

    const/4 v6, 0x0

    iget-object v0, p0, Lru/mail/libverify/accounts/c;->d:Ljava/util/List;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/accounts/c;->d:Ljava/util/List;

    :try_start_0
    sget-object v0, Landroid/provider/ContactsContract$Profile;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v1, "data"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v3, "data1"

    aput-object v3, v2, v0

    const-string/jumbo v3, "mimetype=?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v5, "vnd.android.cursor.item/phone_v2"

    aput-object v5, v4, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v1

    :goto_0
    if-nez v1, :cond_0

    :try_start_2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    invoke-static {v1}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    :goto_1
    return-object v0

    :catch_0
    move-exception v0

    move-object v1, v6

    goto :goto_0

    :cond_0
    :try_start_3
    const-string/jumbo v0, "data1"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    :goto_2
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lru/mail/libverify/accounts/c;->d:Ljava/util/List;

    new-instance v3, Lru/mail/libverify/accounts/a;

    const-string/jumbo v4, "ContactsProfile"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lru/mail/libverify/accounts/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    :goto_3
    invoke-static {v1}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    throw v0

    :cond_1
    invoke-static {v1}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->d:Ljava/util/List;

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object v1, v6

    goto :goto_3
.end method

.method private d(Landroid/content/Context;)Ljava/util/List;
    .locals 8
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;"
        }
    .end annotation

    const/16 v7, 0x29

    const/4 v0, 0x0

    const/4 v6, 0x0

    iget-object v1, p0, Lru/mail/libverify/accounts/c;->e:Ljava/util/List;

    if-nez v1, :cond_9

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lru/mail/libverify/accounts/c;->e:Ljava/util/List;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "data1 IN ("

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    const-string/jumbo v2, "com.google"

    invoke-virtual {v1, v2}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v5

    array-length v1, v5

    if-nez v1, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    array-length v2, v5

    move v1, v0

    :goto_1
    if-ge v1, v2, :cond_1

    const-string/jumbo v4, "?,"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :try_start_0
    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Email;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v7, "contact_id"

    aput-object v7, v2, v4

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    array-length v4, v5

    new-array v4, v4, [Ljava/lang/String;

    :goto_2
    array-length v7, v5

    if-ge v0, v7, :cond_2

    aget-object v7, v5, v0

    iget-object v7, v7, Landroid/accounts/Account;->name:Ljava/lang/String;

    aput-object v7, v4, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-result-object v7

    if-nez v7, :cond_3

    :try_start_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    invoke-static {v7}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    invoke-static {v6}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    goto :goto_0

    :cond_3
    :try_start_2
    const-string/jumbo v0, "contact_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "contact_id IN ("

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    invoke-static {v7}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    invoke-static {v6}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    goto :goto_0

    :cond_4
    :try_start_3
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    :goto_3
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_5

    const/16 v1, 0x2c

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v0

    move-object v1, v6

    move-object v6, v7

    :goto_4
    invoke-static {v6}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    invoke-static {v1}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    throw v0

    :cond_5
    const/16 v0, 0x29

    :try_start_4
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v4, "data1"

    aput-object v4, v2, v0

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v1

    if-nez v1, :cond_6

    :try_start_5
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result-object v0

    invoke-static {v7}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    invoke-static {v1}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    goto/16 :goto_0

    :cond_6
    :try_start_6
    const-string/jumbo v0, "data1"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    :cond_7
    :goto_5
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_7

    iget-object v3, p0, Lru/mail/libverify/accounts/c;->e:Ljava/util/List;

    new-instance v4, Lru/mail/libverify/accounts/a;

    const-string/jumbo v5, "ContactsProfile"

    invoke-direct {v4, v5, v2}, Lru/mail/libverify/accounts/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_5

    :catchall_1
    move-exception v0

    move-object v6, v7

    goto :goto_4

    :cond_8
    invoke-static {v7}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    invoke-static {v1}, Lru/mail/libverify/utils/m;->a(Landroid/database/Cursor;)V

    :cond_9
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->e:Ljava/util/List;

    goto/16 :goto_0

    :catchall_2
    move-exception v0

    move-object v1, v6

    goto :goto_4
.end method

.method private d()Lru/mail/libverify/accounts/a;
    .locals 2

    :try_start_0
    invoke-static {}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->getInstance()Lcom/google/i18n/phonenumbers/PhoneNumberUtil;

    move-result-object v1

    iget-object v0, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    invoke-direct {p0, v0}, Lru/mail/libverify/accounts/c;->a(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-static {v1, v0}, Lru/mail/libverify/accounts/c;->a(Lcom/google/i18n/phonenumbers/PhoneNumberUtil;Ljava/util/List;)Lru/mail/libverify/accounts/a;

    move-result-object v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    invoke-direct {p0, v0}, Lru/mail/libverify/accounts/c;->c(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-static {v1, v0}, Lru/mail/libverify/accounts/c;->a(Lcom/google/i18n/phonenumbers/PhoneNumberUtil;Ljava/util/List;)Lru/mail/libverify/accounts/a;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    invoke-direct {p0, v0}, Lru/mail/libverify/accounts/c;->d(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-static {v1, v0}, Lru/mail/libverify/accounts/c;->a(Lcom/google/i18n/phonenumbers/PhoneNumberUtil;Ljava/util/List;)Lru/mail/libverify/accounts/a;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    invoke-direct {p0, v0}, Lru/mail/libverify/accounts/c;->b(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-static {v1, v0}, Lru/mail/libverify/accounts/c;->a(Lcom/google/i18n/phonenumbers/PhoneNumberUtil;Ljava/util/List;)Lru/mail/libverify/accounts/a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    if-nez v0, :cond_0

    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v0, "PhoneAccountFinder"

    const-string/jumbo v1, "failed to get best match account"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private e()Z
    .locals 5

    const/4 v1, 0x1

    const/4 v0, 0x0

    iget-object v2, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    const-string/jumbo v3, "android.permission.GET_ACCOUNTS"

    invoke-static {v2, v3}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "PhoneAccountFinder"

    const-string/jumbo v3, "can\'t work without %s"

    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v4, "android.permission.GET_ACCOUNTS"

    aput-object v4, v1, v0

    invoke-static {v2, v3, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method


# virtual methods
.method public final declared-synchronized a()Lru/mail/libverify/accounts/a;
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lru/mail/libverify/accounts/c;->e()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->h:Lru/mail/libverify/accounts/a;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lru/mail/libverify/accounts/c;->d()Lru/mail/libverify/accounts/a;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/accounts/c;->h:Lru/mail/libverify/accounts/a;

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->h:Lru/mail/libverify/accounts/a;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized b()Ljava/lang/String;
    .locals 6

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lru/mail/libverify/accounts/c;->e()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->b:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_2

    :try_start_2
    const-string/jumbo v0, "PhoneAccountFinder"

    const-string/jumbo v1, "getGmailAccount start search"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    invoke-static {v0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v1

    array-length v2, v1

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v2, :cond_1

    aget-object v3, v1, v0

    iget-object v4, v3, Landroid/accounts/Account;->type:Ljava/lang/String;

    const-string/jumbo v5, "com.google"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v0, v3, Landroid/accounts/Account;->name:Ljava/lang/String;

    iput-object v0, p0, Lru/mail/libverify/accounts/c;->b:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    :goto_2
    :try_start_3
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->b:Ljava/lang/String;

    if-nez v0, :cond_2

    const-string/jumbo v0, ""

    iput-object v0, p0, Lru/mail/libverify/accounts/c;->b:Ljava/lang/String;

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->b:Ljava/lang/String;

    goto :goto_0

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v0, "PhoneAccountFinder"

    const-string/jumbo v1, "failed to get gmail account"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized c()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/accounts/a;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lru/mail/libverify/accounts/c;->e()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->g:Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lru/mail/libverify/accounts/c;->g:Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->g:Ljava/util/List;

    iget-object v1, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    invoke-direct {p0, v1}, Lru/mail/libverify/accounts/c;->a(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lru/mail/libverify/accounts/c;->g:Ljava/util/List;

    iget-object v1, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    invoke-direct {p0, v1}, Lru/mail/libverify/accounts/c;->c(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lru/mail/libverify/accounts/c;->g:Ljava/util/List;

    iget-object v1, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    invoke-direct {p0, v1}, Lru/mail/libverify/accounts/c;->d(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lru/mail/libverify/accounts/c;->g:Ljava/util/List;

    iget-object v1, p0, Lru/mail/libverify/accounts/c;->a:Landroid/content/Context;

    invoke-direct {p0, v1}, Lru/mail/libverify/accounts/c;->b(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    :goto_1
    :try_start_3
    iget-object v0, p0, Lru/mail/libverify/accounts/c;->g:Ljava/util/List;

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v0, "PhoneAccountFinder"

    const-string/jumbo v1, "failed to enumerate all accounts"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
