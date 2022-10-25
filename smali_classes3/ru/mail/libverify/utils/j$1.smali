.class final Lru/mail/libverify/utils/j$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/utils/j;->a(Landroid/content/Context;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lru/mail/libverify/utils/j;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 8

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, -0x1

    check-cast p1, Lru/mail/libverify/utils/j;

    check-cast p2, Lru/mail/libverify/utils/j;

    invoke-virtual {p1}, Lru/mail/libverify/utils/j;->a()I

    move-result v0

    invoke-virtual {p2}, Lru/mail/libverify/utils/j;->a()I

    move-result v4

    if-ge v0, v4, :cond_0

    move v0, v1

    :goto_0
    if-eqz v0, :cond_2

    :goto_1
    return v0

    :cond_0
    if-ne v0, v4, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v3

    goto :goto_0

    :cond_2
    iget-object v0, p1, Lru/mail/libverify/utils/j;->a:Landroid/content/pm/PackageInfo;

    iget-wide v4, v0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    iget-object v0, p2, Lru/mail/libverify/utils/j;->a:Landroid/content/pm/PackageInfo;

    iget-wide v6, v0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    cmp-long v0, v4, v6

    if-gez v0, :cond_3

    move v0, v1

    goto :goto_1

    :cond_3
    cmp-long v0, v4, v6

    if-nez v0, :cond_4

    move v0, v2

    goto :goto_1

    :cond_4
    move v0, v3

    goto :goto_1
.end method
