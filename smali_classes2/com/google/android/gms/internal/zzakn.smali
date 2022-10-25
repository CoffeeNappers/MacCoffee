.class public abstract Lcom/google/android/gms/internal/zzakn;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzakn$zza;
    }
.end annotation


# instance fields
.field protected final aZr:Lcom/google/android/gms/internal/zzajq;

.field protected final bgi:Lcom/google/android/gms/internal/zzakn$zza;

.field protected final bgj:Lcom/google/android/gms/internal/zzako;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/internal/zzakn$zza;Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzakn;->bgi:Lcom/google/android/gms/internal/zzakn$zza;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzakn;->bgj:Lcom/google/android/gms/internal/zzako;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzakn;->aZr:Lcom/google/android/gms/internal/zzajq;

    return-void
.end method


# virtual methods
.method public abstract zzc(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakn;
.end method

.method public zzcrc()Lcom/google/android/gms/internal/zzajq;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakn;->aZr:Lcom/google/android/gms/internal/zzajq;

    return-object v0
.end method

.method public zzcwp()Lcom/google/android/gms/internal/zzako;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakn;->bgj:Lcom/google/android/gms/internal/zzako;

    return-object v0
.end method

.method public zzcwq()Lcom/google/android/gms/internal/zzakn$zza;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakn;->bgi:Lcom/google/android/gms/internal/zzakn$zza;

    return-object v0
.end method
