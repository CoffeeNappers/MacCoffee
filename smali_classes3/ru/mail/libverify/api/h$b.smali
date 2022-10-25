.class final Lru/mail/libverify/api/h$b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/api/h$b$a;
    }
.end annotation


# instance fields
.field final a:[Lru/mail/libverify/api/h$c;

.field final b:Z


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lru/mail/libverify/api/h$b;->b:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lru/mail/libverify/api/h$b;->a:[Lru/mail/libverify/api/h$c;

    return-void
.end method

.method private constructor <init>(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/api/h$c;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lru/mail/libverify/api/h$b;->b:Z

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lru/mail/libverify/api/h$c;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/api/h$c;

    iput-object v0, p0, Lru/mail/libverify/api/h$b;->a:[Lru/mail/libverify/api/h$c;

    return-void
.end method

.method public static a(Ljava/lang/String;)Lru/mail/libverify/api/h$b;
    .locals 8
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v4, 0x0

    const/4 v2, 0x0

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move v3, v4

    move-object v0, v2

    move-object v1, v2

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_3

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x25

    if-ne v6, v7, :cond_1

    if-nez v1, :cond_2

    if-eqz v0, :cond_0

    iput v3, v0, Lru/mail/libverify/api/h$b$a;->d:I

    invoke-static {p0, v0, v5}, Lru/mail/libverify/api/h$b;->a(Ljava/lang/String;Lru/mail/libverify/api/h$b$a;Ljava/util/ArrayList;)V

    :cond_0
    new-instance v1, Lru/mail/libverify/api/h$b$a;

    invoke-direct {v1, v4}, Lru/mail/libverify/api/h$b$a;-><init>(B)V

    iput v3, v1, Lru/mail/libverify/api/h$b$a;->b:I

    if-eqz v0, :cond_1

    iget v6, v0, Lru/mail/libverify/api/h$b$a;->d:I

    iput v6, v1, Lru/mail/libverify/api/h$b$a;->a:I

    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    iput v3, v1, Lru/mail/libverify/api/h$b$a;->c:I

    move-object v0, v1

    move-object v1, v2

    goto :goto_1

    :cond_3
    if-eqz v0, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    iput v1, v0, Lru/mail/libverify/api/h$b$a;->d:I

    invoke-static {p0, v0, v5}, Lru/mail/libverify/api/h$b;->a(Ljava/lang/String;Lru/mail/libverify/api/h$b$a;Ljava/util/ArrayList;)V

    :cond_4
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    new-instance v0, Lru/mail/libverify/api/h$b;

    invoke-direct {v0}, Lru/mail/libverify/api/h$b;-><init>()V

    :goto_2
    return-object v0

    :cond_5
    new-instance v0, Lru/mail/libverify/api/h$b;

    invoke-direct {v0, v5}, Lru/mail/libverify/api/h$b;-><init>(Ljava/util/List;)V

    goto :goto_2
.end method

.method private static a(Ljava/lang/String;Lru/mail/libverify/api/h$b$a;Ljava/util/ArrayList;)V
    .locals 5
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lru/mail/libverify/api/h$b$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lru/mail/libverify/api/h$b$a;",
            "Ljava/util/ArrayList",
            "<",
            "Lru/mail/libverify/api/h$c;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lru/mail/libverify/api/h$c;

    iget v1, p1, Lru/mail/libverify/api/h$b$a;->a:I

    iget v2, p1, Lru/mail/libverify/api/h$b$a;->b:I

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iget v2, p1, Lru/mail/libverify/api/h$b$a;->c:I

    add-int/lit8 v2, v2, 0x1

    iget v3, p1, Lru/mail/libverify/api/h$b$a;->d:I

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iget v3, p1, Lru/mail/libverify/api/h$b$a;->b:I

    add-int/lit8 v3, v3, 0x1

    iget v4, p1, Lru/mail/libverify/api/h$b$a;->c:I

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lru/mail/libverify/api/h$c;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method
