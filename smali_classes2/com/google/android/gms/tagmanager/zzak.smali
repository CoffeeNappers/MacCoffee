.class Lcom/google/android/gms/tagmanager/zzak;
.super Lcom/google/android/gms/tagmanager/zzam;


# static fields
.field private static final ID:Ljava/lang/String;


# instance fields
.field private final aEa:Lcom/google/android/gms/tagmanager/zzcx;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzag;->zzhu:Lcom/google/android/gms/internal/zzag;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzag;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzak;->ID:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/tagmanager/zzcx;)V
    .locals 2

    sget-object v0, Lcom/google/android/gms/tagmanager/zzak;->ID:Ljava/lang/String;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzam;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzak;->aEa:Lcom/google/android/gms/tagmanager/zzcx;

    return-void
.end method


# virtual methods
.method public zzay(Ljava/util/Map;)Lcom/google/android/gms/internal/zzaj$zza;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzaj$zza;",
            ">;)",
            "Lcom/google/android/gms/internal/zzaj$zza;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzak;->aEa:Lcom/google/android/gms/tagmanager/zzcx;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzcx;->zzcgj()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzdm;->zzchm()Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdm;->zzat(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaj$zza;

    move-result-object v0

    goto :goto_0
.end method

.method public zzcdu()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
