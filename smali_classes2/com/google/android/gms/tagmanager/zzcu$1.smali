.class Lcom/google/android/gms/tagmanager/zzcu$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzcu$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/zzcu;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzt;Lcom/google/android/gms/tagmanager/zzcu$zzb;Lcom/google/android/gms/tagmanager/zzcu$zza;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aGH:Lcom/google/android/gms/tagmanager/zzcu;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzcu;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzcu$1;->aGH:Lcom/google/android/gms/tagmanager/zzcu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzcgg()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    return-object v0
.end method
