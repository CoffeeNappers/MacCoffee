.class final Lcom/danikula/videocache/file/Files$LastModifiedComparator;
.super Ljava/lang/Object;
.source "Files.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/danikula/videocache/file/Files;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LastModifiedComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/danikula/videocache/file/Files$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/danikula/videocache/file/Files$1;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/danikula/videocache/file/Files$LastModifiedComparator;-><init>()V

    return-void
.end method

.method private compareLong(JJ)I
    .locals 1
    .param p1, "first"    # J
    .param p3, "second"    # J

    .prologue
    .line 84
    cmp-long v0, p1, p3

    if-gez v0, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    cmp-long v0, p1, p3

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public compare(Ljava/io/File;Ljava/io/File;)I
    .locals 4
    .param p1, "lhs"    # Ljava/io/File;
    .param p2, "rhs"    # Ljava/io/File;

    .prologue
    .line 80
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/danikula/videocache/file/Files$LastModifiedComparator;->compareLong(JJ)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 76
    check-cast p1, Ljava/io/File;

    check-cast p2, Ljava/io/File;

    invoke-virtual {p0, p1, p2}, Lcom/danikula/videocache/file/Files$LastModifiedComparator;->compare(Ljava/io/File;Ljava/io/File;)I

    move-result v0

    return v0
.end method
