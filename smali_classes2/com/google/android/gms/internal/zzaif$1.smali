.class Lcom/google/android/gms/internal/zzaif$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzakz$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaif;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzakw;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzakz$zza",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic aZU:Lcom/google/android/gms/internal/zzakz;

.field final synthetic aZV:Lcom/google/android/gms/internal/zzaif;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaif;Lcom/google/android/gms/internal/zzakz;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaif$1;->aZV:Lcom/google/android/gms/internal/zzaif;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaif$1;->aZU:Lcom/google/android/gms/internal/zzakz;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Void;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaif$1;->aZU:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p2, Ljava/lang/Void;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzaif$1;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Void;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
