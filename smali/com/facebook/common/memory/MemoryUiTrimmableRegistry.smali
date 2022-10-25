.class public Lcom/facebook/common/memory/MemoryUiTrimmableRegistry;
.super Ljava/lang/Object;
.source "MemoryUiTrimmableRegistry.java"


# static fields
.field private static final sUiTrimmables:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/facebook/common/memory/MemoryUiTrimmable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 24
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/facebook/common/memory/MemoryUiTrimmableRegistry;->sUiTrimmables:Ljava/util/Set;

    .line 23
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static iterable()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/facebook/common/memory/MemoryUiTrimmable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 31
    sget-object v0, Lcom/facebook/common/memory/MemoryUiTrimmableRegistry;->sUiTrimmables:Ljava/util/Set;

    return-object v0
.end method

.method public static registerUiTrimmable(Lcom/facebook/common/memory/MemoryUiTrimmable;)V
    .locals 1
    .param p0, "uiTrimmable"    # Lcom/facebook/common/memory/MemoryUiTrimmable;

    .prologue
    .line 27
    sget-object v0, Lcom/facebook/common/memory/MemoryUiTrimmableRegistry;->sUiTrimmables:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 28
    return-void
.end method
