import { useEffect, useState } from 'react'

interface Dataset {
  id: number
  name: string
  description: string
  tags: string
  last_updated: string
  record_count: number
  owner: string
  source_system: string
  is_public: boolean
  created_at: string
}

function App() {
  const [datasets, setDatasets] = useState<Dataset[]>([])
  const [search, setSearch] = useState("")

  useEffect(() => {
    fetch("http://localhost:8000/datasets")
      .then(res => res.json())
      .then(data => setDatasets(data))
      .catch(err => console.error("Error fetching datasets:", err))
  }, [])

  const filtered = datasets.filter(ds =>
    ds.name.toLowerCase().includes(search.toLowerCase()) ||
    ds.description.toLowerCase().includes(search.toLowerCase())
  )

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-4">Data Catalog</h1>

      <input
        type="text"
        placeholder="Search datasets..."
        className="w-full border px-3 py-2 mb-6 rounded"
        value={search}
        onChange={e => setSearch(e.target.value)}
      />

      <div className="grid gap-4">
        {filtered.map(ds => (
          <div key={ds.id} className="p-4 border rounded shadow-sm">
            <h2 className="text-lg font-semibold">{ds.name}</h2>
            <p className="text-sm text-gray-600">{ds.description}</p>
            <div className="text-xs text-gray-400 mt-2">
              Tags: {ds.tags} · Records: {ds.record_count} · Last updated: {new Date(ds.last_updated).toLocaleDateString()}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

export default App
