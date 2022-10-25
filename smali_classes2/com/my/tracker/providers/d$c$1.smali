.class final Lcom/my/tracker/providers/d$c$1;
.super Ljava/lang/Object;
.source "EnvironmentParamsDataProvider.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/my/tracker/providers/d$c;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Landroid/net/wifi/ScanResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/my/tracker/providers/d$c;


# direct methods
.method constructor <init>(Lcom/my/tracker/providers/d$c;)V
    .locals 0

    .prologue
    .line 205
    iput-object p1, p0, Lcom/my/tracker/providers/d$c$1;->a:Lcom/my/tracker/providers/d$c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2

    .prologue
    .line 205
    check-cast p1, Landroid/net/wifi/ScanResult;

    check-cast p2, Landroid/net/wifi/ScanResult;

    .line 1209
    iget v0, p1, Landroid/net/wifi/ScanResult;->level:I

    iget v1, p2, Landroid/net/wifi/ScanResult;->level:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    .line 1210
    :goto_0
    return v0

    :cond_0
    iget v0, p1, Landroid/net/wifi/ScanResult;->level:I

    iget v1, p2, Landroid/net/wifi/ScanResult;->level:I

    if-le v0, v1, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    .line 1211
    :cond_1
    const/4 v0, 0x0

    .line 205
    goto :goto_0
.end method
