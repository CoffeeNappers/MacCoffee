.class public abstract Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;
.super Ljava/lang/Object;
.source "RxLocationBaseOnSubscribe.java"

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "ApiClientConnectionCallbacks"
.end annotation


# instance fields
.field protected apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

.field final synthetic this$0:Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;


# direct methods
.method protected constructor <init>(Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;)V
    .locals 0
    .param p1, "this$0"    # Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;

    .prologue
    .line 110
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iput-object p1, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;->this$0:Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    return-void
.end method


# virtual methods
.method public setClient(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0
    .param p1, "client"    # Lcom/google/android/gms/common/api/GoogleApiClient;

    .prologue
    .line 114
    .local p0, "this":Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;, "Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe<TT;>.ApiClientConnectionCallbacks;"
    iput-object p1, p0, Lcom/patloew/rxlocation/RxLocationBaseOnSubscribe$ApiClientConnectionCallbacks;->apiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 115
    return-void
.end method
