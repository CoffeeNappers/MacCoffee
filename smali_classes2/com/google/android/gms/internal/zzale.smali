.class public Lcom/google/android/gms/internal/zzale;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzalh;


# instance fields
.field private final aZr:Lcom/google/android/gms/internal/zzajq;

.field private final bhn:Lcom/google/android/gms/internal/zzajl;

.field private final bho:Lcom/google/firebase/database/DatabaseError;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DatabaseError;Lcom/google/android/gms/internal/zzajq;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzale;->bhn:Lcom/google/android/gms/internal/zzajl;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzale;->aZr:Lcom/google/android/gms/internal/zzajq;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzale;->bho:Lcom/google/firebase/database/DatabaseError;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzale;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x7

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":CANCEL"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzcrc()Lcom/google/android/gms/internal/zzajq;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzale;->aZr:Lcom/google/android/gms/internal/zzajq;

    return-object v0
.end method

.method public zzcxk()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzale;->bhn:Lcom/google/android/gms/internal/zzajl;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzale;->bho:Lcom/google/firebase/database/DatabaseError;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajl;->zza(Lcom/google/firebase/database/DatabaseError;)V

    return-void
.end method
