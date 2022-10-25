.class public Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;
.super Ljava/lang/Object;
.source "GameHorHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Ref"
.end annotation


# instance fields
.field public final appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;

.field public final catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

.field public final index:I

.field public final onNeedLoadNextPage:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;

.field public final titleRes:I


# direct methods
.method public constructor <init>(IILcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;Ljava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "titleRes"    # I
    .param p2, "index"    # I
    .param p3, "onNeedLoadNextPage"    # Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "catalogInfo"    # Lcom/vkontakte/android/data/CatalogInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p7, "canShowBadge"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;",
            "Lcom/vkontakte/android/data/CatalogInfo;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p4, "applications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->titleRes:I

    .line 57
    iput p2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->index:I

    .line 58
    iput-object p3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->onNeedLoadNextPage:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$OnNeedLoadNextPage;

    .line 59
    new-instance v0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;

    invoke-direct {v0, p6, p7}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;

    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;

    invoke-virtual {v0, p4}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->setApiApplications(Ljava/util/ArrayList;)V

    .line 61
    iput-object p5, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    .line 62
    return-void
.end method


# virtual methods
.method public clearNotificationOnApp(I)V
    .locals 1
    .param p1, "appId"    # I

    .prologue
    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$Ref;->appAdapter:Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->clearNotificationOnApp(I)V

    .line 66
    return-void
.end method
