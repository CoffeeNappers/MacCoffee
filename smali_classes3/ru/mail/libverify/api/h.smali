.class final Lru/mail/libverify/api/h;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/api/h$c;,
        Lru/mail/libverify/api/h$b;,
        Lru/mail/libverify/api/h$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lru/mail/libverify/api/h$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lru/mail/libverify/api/h;->a:Ljava/util/HashMap;

    return-void
.end method

.method static a(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Ljava/lang/String;
    .locals 10
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    const/4 v3, 0x0

    invoke-static {p0, p1}, Lru/mail/libverify/api/h;->d(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Z

    move-result v0

    if-nez v0, :cond_1

    move-object v0, v1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    iget-object v4, p1, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    array-length v5, v4

    move v2, v3

    :goto_1
    if-ge v2, v5, :cond_5

    aget-object v0, v4, v2

    const-string/jumbo v6, "CodeParser"

    const-string/jumbo v7, "try to parse using regular expression"

    invoke-static {v6, v7}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v6, "^"

    invoke-virtual {v0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    const-string/jumbo v6, "$"

    invoke-virtual {v0, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    const-string/jumbo v6, "$1"

    invoke-virtual {p0, v0, v6}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    :cond_2
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1

    :cond_3
    const-string/jumbo v6, "CodeParser"

    const-string/jumbo v7, "try to parse using template"

    invoke-static {v6, v7}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v6, "%"

    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-ltz v6, :cond_2

    invoke-virtual {v0, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "%"

    add-int/lit8 v9, v6, 0x1

    invoke-virtual {v0, v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v8

    if-ltz v8, :cond_2

    if-le v8, v6, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-eq v8, v6, :cond_4

    add-int/lit8 v6, v8, 0x1

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {p0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v0, v7, v0

    invoke-virtual {p0, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lru/mail/libverify/api/h;->a(Lru/mail/libverify/api/h$a;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    const-string/jumbo v1, "CodeParser"

    const-string/jumbo v2, "successfully extracted code %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v3

    invoke-static {v1, v2, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    :cond_4
    const-string/jumbo v0, ""

    goto :goto_2

    :cond_5
    move-object v0, v1

    goto/16 :goto_0
.end method

.method private static a(Lru/mail/libverify/api/h$a;Ljava/lang/String;)Z
    .locals 6
    .param p0    # Lru/mail/libverify/api/h$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v2, p0, Lru/mail/libverify/api/h$a;->c:I

    if-eqz v2, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    iget v3, p0, Lru/mail/libverify/api/h$a;->c:I

    if-ne v2, v3, :cond_0

    :cond_2
    iget-object v2, p0, Lru/mail/libverify/api/h$a;->d:Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    sget-object v3, Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;->NUMERIC:Lru/mail/libverify/requests/response/VerifyApiResponse$CodeType;

    if-ne v2, v3, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    array-length v4, v3

    move v2, v0

    :goto_1
    if-ge v2, v4, :cond_5

    aget-char v5, v3, v2

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-nez v5, :cond_4

    move v2, v0

    :goto_2
    if-eqz v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_5
    move v2, v1

    goto :goto_2
.end method

.method static b(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Ljava/lang/String;
    .locals 12
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0, p1}, Lru/mail/libverify/api/h;->d(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    iget-object v6, p1, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    array-length v7, v6

    const/4 v0, 0x0

    move v5, v0

    :goto_1
    if-ge v5, v7, :cond_9

    aget-object v2, v6, v5

    const/4 v1, 0x0

    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    sget-object v0, Lru/mail/libverify/api/h;->a:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/h$b;

    if-nez v0, :cond_2

    invoke-static {v2}, Lru/mail/libverify/api/h$b;->a(Ljava/lang/String;)Lru/mail/libverify/api/h$b;

    move-result-object v0

    sget-object v3, Lru/mail/libverify/api/h;->a:Ljava/util/HashMap;

    invoke-virtual {v3, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    iget-boolean v2, v0, Lru/mail/libverify/api/h$b;->b:Z

    if-eqz v2, :cond_7

    iget-object v2, v0, Lru/mail/libverify/api/h$b;->a:[Lru/mail/libverify/api/h$c;

    if-eqz v2, :cond_7

    const/4 v2, 0x0

    :goto_2
    iget-object v3, v0, Lru/mail/libverify/api/h$b;->a:[Lru/mail/libverify/api/h$c;

    array-length v3, v3

    if-ge v2, v3, :cond_7

    iget-object v3, v0, Lru/mail/libverify/api/h$b;->a:[Lru/mail/libverify/api/h$c;

    aget-object v9, v3, v2

    iget-object v3, v9, Lru/mail/libverify/api/h$c;->a:Ljava/lang/String;

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_7

    iget-object v3, v9, Lru/mail/libverify/api/h$c;->b:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    move v4, v1

    :goto_3
    if-ltz v4, :cond_7

    const/4 v3, -0x1

    add-int/lit8 v1, v4, -0x1

    :goto_4
    if-ltz v1, :cond_3

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x20

    if-eq v10, v11, :cond_6

    move v3, v1

    :cond_3
    if-ltz v3, :cond_7

    const/16 v1, 0x20

    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v1

    if-gez v1, :cond_4

    const/4 v1, 0x0

    :cond_4
    iget-object v10, v9, Lru/mail/libverify/api/h$c;->c:Ljava/lang/String;

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v8, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v9, Lru/mail/libverify/api/h$c;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_5
    iget-object v3, v9, Lru/mail/libverify/api/h$c;->b:Ljava/lang/String;

    iget-object v4, v9, Lru/mail/libverify/api/h$c;->a:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v1, v4

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    move v4, v1

    goto :goto_3

    :cond_6
    add-int/lit8 v1, v1, -0x1

    goto :goto_4

    :cond_7
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    const-string/jumbo v0, "code"

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p1, v0}, Lru/mail/libverify/api/h;->a(Lru/mail/libverify/api/h$a;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v0, "verify_url"

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_8
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto/16 :goto_1

    :cond_9
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method static c(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Z
    .locals 5
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz p1, :cond_0

    iget-object v1, p1, Lru/mail/libverify/api/h$a;->a:[Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lru/mail/libverify/api/h$a;->a:[Ljava/lang/String;

    array-length v1, v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v2, p1, Lru/mail/libverify/api/h$a;->a:[Ljava/lang/String;

    array-length v3, v2

    move v1, v0

    :goto_1
    if-ge v1, v3, :cond_0

    aget-object v4, v2, v1

    invoke-virtual {p0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private static d(Ljava/lang/String;Lru/mail/libverify/api/h$a;)Z
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz p1, :cond_0

    iget-object v1, p1, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lru/mail/libverify/api/h$a;->b:[Ljava/lang/String;

    array-length v1, v1

    if-nez v1, :cond_1

    :cond_0
    const-string/jumbo v1, "CodeParser"

    const-string/jumbo v2, "not enough arguments to parse code"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return v0

    :cond_1
    iget v1, p1, Lru/mail/libverify/api/h$a;->c:I

    if-lez v1, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    iget v2, p1, Lru/mail/libverify/api/h$a;->c:I

    if-ge v1, v2, :cond_2

    const-string/jumbo v1, "CodeParser"

    const-string/jumbo v2, "message text is too small to start parsing"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method
