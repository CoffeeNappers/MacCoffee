.class Lcom/vkontakte/android/data/RecentItemStore$RecentItem;
.super Ljava/lang/Object;
.source "RecentItemStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/RecentItemStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecentItem"
.end annotation


# instance fields
.field code:Ljava/lang/String;

.field count:F

.field final synthetic this$0:Lcom/vkontakte/android/data/RecentItemStore;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/data/RecentItemStore;)V
    .locals 0

    .prologue
    .line 160
    iput-object p1, p0, Lcom/vkontakte/android/data/RecentItemStore$RecentItem;->this$0:Lcom/vkontakte/android/data/RecentItemStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/data/RecentItemStore;Lcom/vkontakte/android/data/RecentItemStore$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/data/RecentItemStore;
    .param p2, "x1"    # Lcom/vkontakte/android/data/RecentItemStore$1;

    .prologue
    .line 160
    invoke-direct {p0, p1}, Lcom/vkontakte/android/data/RecentItemStore$RecentItem;-><init>(Lcom/vkontakte/android/data/RecentItemStore;)V

    return-void
.end method
